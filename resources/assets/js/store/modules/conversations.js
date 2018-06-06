import conversation from './conversation'
import api from '../api/all'

const state = {
    conversations : [],
    loadingConversations : false,
}

const getters = {
    allConversations: state => {
        return state.conversations
    },
    loadingConversations: state => {
        return state.loadingConversations
    },
}

const actions = {
    getConversations({dispatch,commit},page) {
        commit('setConversationsLoading', true)
        api.getConversations(1).then((response) => {
            commit('setConversations', response.data.data)
            commit('setConversationsLoading', false)
        })

        /* не работает ошибка 500
         * p.s заработало, ошибка была из-за того что в channels указал user.* а надо было user.{userId}
          * */
        Echo.private('user.' + Laravel.user.id)
            .listen('ConversationCreated', (e) => {
                commit('prependToConversations', e.data)
            })
            .listen('ConversationReplyCreated', (e) => {
                commit('prependToConversations', e.data.parent.data)
            })
            .listen('ConversationUsersCreated', (e) => {
                commit('updateConversationInList', e.data)
            })
    },
}

const mutations = {
    setConversations (state, conversations) {
        state.conversations = conversations
    },
    setConversationsLoading (state, status) {
        state.loadingConversations = status
    },
    /* сортируем беседы, то есть беседа в которой сообщение было написано позже переносится вверх */
    prependToConversations (state, conversation) {

        state.conversations = state.conversations.filter((c) => {
            return c.id !== conversation.id
        })

         state.conversations.unshift(conversation)
    },
    updateConversationInList (state, conversation) {
        state.conversations = state.conversations.map((c) => {
            if (c.id == conversation.id) {
                return conversation
            }

            return c
        })
    }
}

const modules = {
    conversation : conversation
}

export default {
    state,
    getters,
    actions,
    mutations,
    modules,
}