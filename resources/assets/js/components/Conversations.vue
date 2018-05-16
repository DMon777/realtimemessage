<template>
   <div class="panel panel-default">
      <div class="panel-heading">
         Conversations
      </div>
      <div class="panel-body">
         <div class="media" v-for = 'conversation in conversations'>
            <div class="media-body">
               {{ conversation.body }}
            </div>
         </div>
      </div>
      <div class="row">
         <div v-for = 'item in allData'>{{item}}</div>
      </div>
   </div>
</template>

<script>

    import { mapActions,mapGetters } from 'vuex'
    export default {
        computed: mapGetters({
            conversations: 'allConversations',
            allData : "allData"
        }),
        methods: {
            ...mapActions([
                'getConversations',
                'getAllData'
            ])
        },
        beforeMount () {
            console.log(this.conversations)
            console.log(this.allData)
            this.getConversations(1)
            this.getAllData()
        },
        mounted () {


        }

    }
</script>