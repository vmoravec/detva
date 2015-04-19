Detva.View = Backbone.View.extend({

  default_region: {
    id:    Detva.config.default_region_id,
    clear: true,
    insert: 'append',
  },

  validation_errors: {},

  constructor: function(options) {
    this.options || (this.options = {})
    _.extend(this.options, options);
    // Make sure we have complete region options defined
    this._extend_region_options();
    // Add empty object for subviews
    this.subviews = {};
    Backbone.View.apply(this, arguments);
  },

  render: function(options) {
    if ( options ) {
      _.extend(this.options, options);
      this._extend_region_options();
      if ( options.flash ) this.options.flash = options.flash;
    }
    this._render_template();
    this._set_up_region();
    Detva.Utils.collapse_navbar();
    if ( this.options.flash ) Detva.Flash.render(this.options.flash);
    this.render_subviews();
  },

  create_spinner: function(e) {
    return Ladda.create(e.currentTarget);
  },

  redirect_to: function(path, flash) {
    this.utils.navigate(path, flash);
  },


  _set_up_region: function() {
    // Find or create the region by its id
    this.region = Detva.Regions.find_or_create(this.options.region.id);
    // Empty the region if the view expects it
    if ( this.options.region.clear ) this.region.clear();
    // Add this view into the views collection for the region
    this.region.add_view(this);
    // Render the view into the region; The view.$el will be inserted into the region.$el
    this.region.render_view(this.options.region.insert, this.$el);
  },

  destroy: function() {
    this._destroy_subviews();
    this.undelegateEvents();
    this.unbind();
    this.$el.removeData().unbind();
    this.remove();
    Backbone.View.prototype.remove.call(this);
    this.region && this.region.remove_view(this);
  },

  utils: {
    relative_time: function(timestamp) {
      return Detva.Utils.relative_time(timestamp);
    },

    scroll_top: function() {
      $("html, body").animate({ scrollTop: 0 }, "slow")
    },

    navigate: function(path, flash) {
      Backbone.history.navigate(path, {trigger: true});
      if (flash) Detva.Flash.render(flash);
    }
  },

  activate_navbar: function(navbar_id) {
    var $navbar = $(navbar_id);
    $('.navbar-nav').find('li.active').removeClass('active');
    $navbar.addClass('active');
  },

  _extend_region_options: function() {
    if (!this.options.region) this.options.region = {};
    _.defaults(this.options.region, _.clone(this.default_region));
  },

  _render_template: function() {
    console.log(this.template);
    console.log(Detva.config.templates_path + this.template);
    this.$el.html(JST[Detva.config.templates_path + this.template]({view: this}));
  },

  _destroy_region: function(view) {
    view || ( view = this );
    if ( view.region && view.region.id !== Detva.config.default_region_id ) {
      view.region.destroy();
    }
  },

  _destroy_subviews: function() {
    _.each(_.values(this.subviews), function(view) {
      view.destroy();
      view._destroy_region();
    });
  },

  render_subviews: function() {
    var view = this;
    var subviews = this.subviews;
    if ( ! _.isEmpty(subviews) ) {
      _.each(_.values(subviews), function(subview) {
        subview.render();
      });
    }

  },

   _super: function() {
     return Detva.View.prototype;
   }
})
