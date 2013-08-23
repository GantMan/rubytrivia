# Gonna have to switch this to formotion https://github.com/clayallsopp/formotion
class SettingsScreen < PM::FormotionScreen
  attr_accessor :trivia
  title "Settings"

  def table_data
    @help_table_data ||= 
    {
      persist_as: :settings,
      sections: [{ 
        title: "Question Categories",
          rows: [
            { 
              title: "Category1",
              key: :Category1,
              type: :switch,
              value: true
            },
            { 
              title: "Category2",
              key: :Category2,
              type: :switch,
              value: true
            }
          ]
      },{ 
        title: "Credits",
          rows: [
            { title: "Programming: Iconoclast Labs", key: :us, type: :static},
            { title: "Questions: via Github ruby-trivia", key: :questions, type: :static },
            { title: "Background: SubtlePatterns.com", key: :credit, type: :static}
          ]
      }]
    }

  end

  def on_load
    # If the next line is commented out, this crashes! wat!?
    $form = self.form

    #manually invoking persist of formotion
    # https://github.com/clayallsopp/formotion/blob/master/lib/formotion/form/form.rb#L25
    # submitted pull request 142 to Formotion to make this easier
    # https://github.com/clayallsopp/formotion/pull/142
    self.form.open
    self.form.init_observer_for_save

    self.form.row(:us).on_tap do |row|
      email_us
    end
  end

  def email_us
    mailto_link = "mailto:developers@iconoclastlabs.com".nsurl
    UIApplication.sharedApplication.openURL(mailto_link)
  end
  
  def modal_tapped
    open_modal ModalScreen.new(nav_bar: true)
  end
  
  def on_return(args={})
    PM.logger.info args
  end
  
end
