class AnswerScreen < PM::Screen
  include TriviaModal
  stylesheet AnswerScreenStylesheet
  title "Answer"
  attr_accessor :answer

  def will_appear
    @label = append!(UILabel, :main_text)
    @label.code_style(answer)
    mp "Answer will appear"
  end

end
