// See http://brunch.io for documentation.
module.exports = {
  paths: {
    watched: ['app/brunch'],
    public: 'vendor/assets'
  },

  files: {
    javascripts: {joinTo: 'javascripts/app.js'},
    stylesheets: {joinTo: 'stylesheets/app.css'}
  }
}
