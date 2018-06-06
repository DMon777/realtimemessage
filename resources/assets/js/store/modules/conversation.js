import api from '../api/all'

const state = {
    conversation : null,
    loadingConversation : false,
}

const getters = {
    currentConversation : state => {
        return state.conversation;
    },
    loadingConversation: state => {
        return state.loadingConversation
    },
}

const actions = {
    getConversation ({dispatch, commit}, id) {
        commit('setConversationLoading', true)

        /* закрываем прослушивание канала, для того чтобы каждый раз открывалось новое при пеерзагрузке
         * страницы. */
        if (state.conversation) {
            Echo.leave('conversation.' + state.conversation.id);
        }

        api.getConversation(id).then((response) => {
            commit('setConversation',response.data.data)
            commit('setConversationLoading', false)
        });

        Echo.private('conversation.' + id)
            .listen('ConversationReplyCreated', (e) => {
                commit('appendToConversation', e.data)
            })
            .listen('ConversationUsersCreated', (e) => {
                commit('updateUsersInConversation', e.data.users.data)
            });


        window.history.pushState(null, null, '/conversations/' + id)
    },

    createConversationReply ({dispatch, commit}, {id, body}) {

       return api.storeConversationReply(id, {
            body: body
        })
        .then((response) => {
            commit('appendToConversation', response.data.data);
            commit('prependToConversations', response.data.data.parent.data)
        })
    },
    createConversation ({dispatch, commit}, {body, recipientIds}) {
        return api.storeConversation({
            body: body,
            recipientIds: recipientIds
        }).then((response) => {
             dispatch('getConversation', response.data.data.id)
             commit('prependToConversations', response.data.data)
        })
    },
    addConversationUsers ({dispatch, commit}, {id, recipientIds}) {
        return api.storeConversationUsers(id, {
            recipientIds: recipientIds
        }).then((response) => {
            commit('updateUsersInConversation', response.data.data.users.data)
             commit('updateConversationInList', response.data.data)
        })
    }

}

const mutations = {
    setConversation (state, conversation) {
        state.conversation = conversation
    },setConversationLoading (state, status) {
        state.loadingConversation = status
    },
    appendToConversation (state, reply) {
        // unshift добавляет элемент в начало массива
        state.conversation.replies.data.unshift(reply)
    },
    updateUsersInConversation (state , users) {

        state.conversation.users.data = users;

    //     users.forEach((user) => {
    //         var exists = state.conversation.users.data.some((u) => {
    //             return u.id == user.id;
    //         });
    //
    //         if(!exists) {
    //             state.conversation.users.data.push(user);
    //         }
    //     })
     }
}

export default {
    state,
    getters,
    actions,
    mutations,
}