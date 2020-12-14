ldnotify = (opt={}) ->
  @opt = do
    className: <[alert ld]>
    classIn: <[ld-bounce-in]>
    classOut: <[ld-fade-out]>
    delay: 2000
  @opt <<< opt
  <[className classIn classOut]>map ~>
    if typeof(@opt[it]) == \string => @opt[it] = @opt[it].split(' ').filter(->it.trim!)
  @root = if typeof(opt.root) == \string => document.querySelector(opt.root) else opt.root
  if !@root => @root = document.body.appendChild(document.createElement(\div))
  @root.classList.add \ldnotify
  @

ldnotify.prototype = Object.create(Object.prototype) <<< do
  send: (type, msg) ->
    node = document.createElement \div
    node.setAttribute \class, (@opt.className ++ @opt.classIn ++ ["alert-" + type]).join(' ')
    node.innerText = msg
    @root.insertBefore node, @root.childNodes.0
    setTimeout (~>
      node.classList.remove.apply node.classList, @opt.classIn
      node.classList.add.apply node.classList, @opt.classOut
      setTimeout (~> if node.parentNode => node.parentNode.removeChild node), @opt.delay
    ), @opt.delay

if module? => module.exports = ldnotify
if window? => window.ldnotify = ldnotify
