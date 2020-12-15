lc = {}

ldnotify = (opt={}) ->
  @opt = do
    className: <[ldnotify-item]>
    classIn: <[ldnotify-in]>
    classOut: <[ldnotify-out]>
    delay: 2000
  @opt <<< opt
  <[className classIn classOut]>map ~>
    if typeof(@opt[it]) == \string => @opt[it] = @opt[it].split(' ').filter(->it.trim!)
  if opt.class-by-type => @class-by-type = opt.class-by-type
  @root = if typeof(opt.root) == \string => document.querySelector(opt.root) else opt.root
  if !@root => @root = document.body.appendChild(document.createElement(\div))
  @root.classList.add \ldnotify
  @

ldnotify.prototype = Object.create(Object.prototype) <<< do
  class-by-type: -> "ldnotify-#it"
  send: (type, msg) ->
    node = document.createElement \div
    span = document.createElement \span
    node.appendChild span
    node.setAttribute \class, (@opt.className ++ @opt.classIn ++ [@class-by-type(type)]).join(' ')
    span.innerText = msg
    @root.insertBefore node, @root.childNodes.0
    setTimeout (~>
      node.classList.remove.apply node.classList, @opt.classIn
      node.classList.add.apply node.classList, @opt.classOut
      setTimeout (~> if node.parentNode => node.parentNode.removeChild node), @opt.delay
    ), @opt.delay

ldnotify.send = (...args) ->
  if !lc.obj => lc.obj = new ldnotify!
  lc.obj.send.apply lc.obj, args

if module? => module.exports = ldnotify
if window? => window.ldnotify = ldnotify
