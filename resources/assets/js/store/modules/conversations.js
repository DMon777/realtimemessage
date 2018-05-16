import conversation from './conversation'
import api from '../api/all'

const state = {
    conversations : [],
    loadingConversation : false,
    allData : []
}

const getters = {
    allConversations: state => {
        return state.conversations
    },
    allData : state => {
        return state.allData
    }
}

const actions = {
    getConversations({dispatch,commit},page) {
        api.getConversations(1).then((response) => {
            commit('setConversations', response.data.data)
        })
    },
    getAllData : ({dispatch,commit}) => {
        commit("setAllData",[1,2,3])
    }
}

const mutations = {
    setConversations (state, conversations) {
        state.conversations = conversations
    },
    setAllData: (state,data) => {
        state.allData = data
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