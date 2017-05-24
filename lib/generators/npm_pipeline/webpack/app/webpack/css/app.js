// http://stackoverflow.com/a/30652110/873870
function requireAll (r) { r.keys().forEach(r) }

requireAll(require.context('./components/', true, /\.scss$/))
