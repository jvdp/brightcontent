#= require bootstrap-wysihtml5/b3
#= require brightcontent/wysithtml5-parser-rules
#= require bootstrap-wysihtml5/locales/nl-NL
#= require Markdown.Converter
#= require Markdown.Editor
#= require Markdown.Sanitizer

$ ->
  editorLocale = $('body').data('editorLocale')

  $('[data-wysihtml5]').wysihtml5
    html: true
    locale: editorLocale
    parserRules: wysihtml5ParserRules
    events:
      load: ->
        editor = $("#insertable").data("wysihtml5").editor
        editor.focus()

  if textbox = $('[data-pagedown]')
    textbox
      .attr('id', 'wmd-input').addClass("wmd-input")
      .before('<div id="wmd-button-bar" class="wmd-button-bar"></div>')
      .after('<div id="wmd-preview" class="wmd-preview"></div>')
      .parent().addClass("wmd-panel clearfix")

    converter = new Markdown.Converter
    editor = new Markdown.Editor(converter)
    editor.run()

  $("#attachments").on "click", ".insert_image", (e) ->
    e.preventDefault()
    editor.composer.commands.exec "insertImage",
      src: $(this).data("insertImage")

  $("#attachments").on "click", ".insert_link", (e) ->
    e.preventDefault()
    editor.composer.commands.exec "createLink",
      href: $(this).data("insertUrl")
      target: "_blank"
      rel: "nofollow"
      text: $(this).data("insertName")
