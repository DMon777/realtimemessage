import algolia from 'algoliasearch'
import autocomplete from 'autocomplete.js'

var index = algolia('179LEOZIDD', 'a4cbbc0a1cb8e208ed8cfa89b461cbb1')

export const userautocomplete = selector => {
    var users = index.initIndex('users')

    return autocomplete(selector, {}, {
        source: autocomplete.sources.hits(users, { hitsPerPage: 10 }),
        displayKey: 'name',
        templates: {
            suggestion (suggestion) {
                return '<span>' + suggestion.name + '</span>'
            },
            empty: '<div class="aa-empty">No people found.</div>'
        }
    })
}
