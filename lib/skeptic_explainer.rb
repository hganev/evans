module SkepticExplainer
  extend self

  RESTRICTIONS = {
    no_semicolons:          'Не ползвайте ; за да разделяте изрази',
    max_nesting_depth:      'Най-много %d нива на влагане',
    lines_per_method:       'Най-много %d реда на метод',
    methods_per_class:      'Най-много %d метода в клас',
    line_length:            'Най-много %d символа на ред',
    no_trailing_whitespace: 'Без whitespace на края на реда',
  }.with_indifferent_access

  def restriction_name(rule, option)
    if RESTRICTIONS.has_key? rule
      RESTRICTIONS[rule] % [option]
    else
      restriction_paremeter(rule, option)
    end
  end

  def command_line(restrictions)
    options = restrictions.
      map { |rule, option| restriction_paremeter(rule, option) }.
      join(' ')

    "skeptic #{options} solution.rb"
  end

  private

  def restriction_paremeter(rule, option)
    "--#{rule.to_s.dasherize} #{option}".gsub(/ true$/, '')
  end
end
