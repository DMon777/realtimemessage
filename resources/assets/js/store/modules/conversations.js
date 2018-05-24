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