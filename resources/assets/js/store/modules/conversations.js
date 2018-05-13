import conversation from './conversation'
import api from '../api/all'

const state = {
    conversations : [],
    loadingConversatoin : false,
}

const getters = {

}

const actions = {
    getConversations({dispatch,commit},page) {

    }
}

const mutations = {

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