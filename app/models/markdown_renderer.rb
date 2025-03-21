class MarkdownRenderer
  def self.render(markdown)
    Commonmarker.to_html(markdown, **options)
  end

  private

  def self.options
    {
      options: {
        parse: {
          smart: true,
        },
        render: {
          escape: false,
          unsafe: true,
          hardbreaks: false,
          full_info_string: true,
          width: 30
        },
        extension: {
          footnotes: true,
          alerts: true,
        },
      }
    }
  end
end
