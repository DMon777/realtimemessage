<template>
   <div class="panel panel-default">
      <div class="panel-heading">
         Conversations
      </div>
      <div class="panel-body">
         <div class = "loader" v-if = "loading">  </div>
         <div class="media" v-for = 'conversation in conversations' v-else-if="conversations.length" >
            <div class="media-body">
               <a href="" @click.prevent = "getConversation(conversation.id)"> {{ trunc(conversation.body,50) }} </a>
               <p class="text-module">
                  You and {{ conversation.participant_count }} {{ pluralize('other',conversation.participant_count) }}
               </p>
               <ul class="list-inline">
                  <li>
                     <img v-bind:src = "user.avatar" v-bind:alt = "user.name + 'avatar'" v-bind:title = "user.name"
                     v-for = "user in conversation.users.data">
                  </li>
                  <li>
                     last reply {{ conversation.last_reply_human }}
                  </li>
               </ul>
            </div>
         </div>
         <div v-else > No conversations </div>

      </div>
   </div>
</template>

<script>

    import trunc from '../helpers/trunc'
    import { mapActions,mapGetters } from 'vuex'
    import pluralize from 'pluralize'

    export default {
        computed: mapGetters({
            conversations: 'allConversations',
            loading : "loadingConversations"
        }),
        methods: {
            ...mapActions([
                'getConversations',
                'getConversation',
            ]),
            trunc : trunc,
            pluralize : pluralize,
        },
        mounted () {
            this.getConversations(1)
        }

    }
</script>