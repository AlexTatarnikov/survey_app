module.exports = {
  test: /\.vue(\.erb)?$/,
  use: [{
    loader: 'vue-loader',
    options: {
      loaders: {
        js: 'babel-loader?presets[]=es2015',
        scss: 'vue-style-loader!css-loader!sass-loader',
        sass: 'vue-style-loader!css-loader!sass-loader?indentedSyntax'
      }
    }
  }]
}
