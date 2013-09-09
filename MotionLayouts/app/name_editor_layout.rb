class NameEditorLayout
  include Layouts::Base

  def self.template
    UIToolbar {
      anchor 'top'
      height 50
      resize :top, :right, :left, :width
      items [
        ['Cancel', 'cancel'],
        [:flexible_space],
        ['Done', 'done']
      ]
    }
    UITextField {
      id 'nameTextField'
      delegate @controller
      top 90
      width 85.percent
      align 'center'
      text_color '222222'
      background_color 'FFFFFF'
      border_style 'rounded'
      resize :top, :right, :left, :width
      placeholder 'Enter the photo album name'
    }
  end
end