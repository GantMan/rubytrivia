class QuestionScreen < PM::Screen
  stylesheet :question_stylesheet

  title "Ruby Trivia"

  def on_load
    set_nav_bar_button :right, title: "Settings", action: :settings_tapped
    @trivia = Trivia.new
  end
  
  def will_appear
    @view_setup ||= set_up_view
  end

  def set_up_view
    set_attributes self.view, stylename: :question_view
    add @label = UILabel.new, stylename: :my_label
    add @seg = UISegmentedControl.bar(["New Question","Answer"]), stylename: :segmented

    # button actions
    @seg.on(:change) { ||
      ap "Touched! #{@seg.selectedSegmentIndex}"
      @label.text = @trivia.next_line
      @label.fit_to_size(40)
      @seg.setSelectedSegmentIndex(UISegmentedControlNoSegment)
    }

    true
  end

  def settings_tapped
    ap "Settings Called"
    open_modal ModalScreen.new(nav_bar: true)
  end

end
