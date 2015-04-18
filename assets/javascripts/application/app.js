window.App = {

  config: {
    api_url_prefix: '/api/v1/',
    default_region_id: 'content'
  },

  Collections: {},
  Models:      {},
  Routers:     {},
  Views:       {},

  initialize: function() {
    Backbone.history.start({
      pushState: true
    });
  },
};

$(document).ready(function(){
  $(document.body).on('click', 'a', function(e){
   e.preventDefault();
   Backbone.history.navigate(e.currentTarget.pathname, {trigger: true});
 });

  App.initialize();
});

