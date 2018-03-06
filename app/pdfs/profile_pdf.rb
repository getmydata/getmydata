class ProfilePdf < Prawn::Document
  def initialize(user)
    @user = user
    super(top_margin: 70)
    getmydata_logo
    user_info
  end

  def getmydata_logo
    text "GetMyData - Your data", size: 18, style: :bold
  end

  def user_info
    move_down 20
    text "Name:", size: 14, style: :bold
    text "#{@user.first_name} #{@user.last_name} ", size: 14, style: :normal

    text "Email:", size: 14, style: :bold
    text "#{@user.email}", size: 14, style: :normal

    text "Password:", size: 14, style: :bold
    text "#{@user.encrypted_password}", size: 14, style: :normal

    text "Sign in count:", size: 14, style: :bold
    text "#{@user.sign_in_count}", size: 14, style: :normal

    text "Current sign in: ", size: 14, style: :bold
    text "#{@user.current_sign_in_at}", size: 14, style: :normal

    text "Last sign in:", size: 14, style: :bold
    text "#{@user.last_sign_in_at}", size: 14, style: :normal

    text "Created at: ", size: 14, style: :bold
    text "#{@user.created_at}", size: 14, style: :normal

    text "Updated at:", size: 14, style: :bold
    text "#{@user.updated_at}", size: 14, style: :normal
  end
end
