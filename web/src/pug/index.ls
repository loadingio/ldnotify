if true =>
  # customize ldnotify with a standalone object
  ldn = new ldnotify!
  ldn.send \success, "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
  ldn.send \danger, "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
  ldn.send \warning, "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
  ldn.send \light, ("Lorem Ipsum is simply dummy text of the printing" * 10)
  ldn.send \dark, "Lorem Ipsum is simply dummy text of the ..."
else
  # simply use the default object
  ldnotify.send \success, "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
  ldnotify.send \danger, "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
  ldnotify.send \warning, "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
  ldnotify.send \light, ("Lorem Ipsum is simply dummy text of the printing" * 10)
  ldnotify.send \dark, "Lorem Ipsum is simply dummy text of the ..."

