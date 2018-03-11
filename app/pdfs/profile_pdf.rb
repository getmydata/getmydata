require "open-uri"

class ProfilePdf < Prawn::Document
  def initialize(user)
    @user = user
    super(top_margin: 70)
    getmydata_logo
    user_info
  end

  def getmydata_logo
    image open("http://www.campie.nl/wp-content/uploads/2018/03/Getmydata_logo.png"), :width => 200
    move_down 20
    text "Your data", size: 18, style: :bold
  end

  def user_info
    text "Name:", size: 14, style: :bold
    text "#{@user.first_name} #{@user.last_name} ", size: 14, style: :normal
    move_down 10
    text "Email:", size: 14, style: :bold
    text "#{@user.email}", size: 14, style: :normal
    move_down 10
    text "Avatar:", size: 14, style: :bold
    image open("#{@user.avatar}"), :width => 100
    move_down 10
    text "identification:", size: 14, style: :bold
    image open("#{@user.identification}"), :width => 300
    move_down 10
    text "Password:", size: 14, style: :bold
    text "#{@user.encrypted_password}", size: 14, style: :normal
    move_down 10
    text "Sign in count:", size: 14, style: :bold
    text "#{@user.sign_in_count}", size: 14, style: :normal
    move_down 10
    text "Current sign in: ", size: 14, style: :bold
    text "#{@user.current_sign_in_at.class}", size: 14, style: :normal
    move_down 10
    text "Last sign in:", size: 14, style: :bold
    text "#{@user.last_sign_in_at}", size: 14, style: :normal
    move_down 10
    text "Created at: ", size: 14, style: :bold
    text "#{@user.created_at}", size: 14, style: :normal
    move_down 10
    text "Updated at:", size: 14, style: :bold
    text "#{@user.updated_at}", size: 14, style: :normal
    move_down 10

    text "Messages:", size: 14, style: :bold
    @user.messages.each do |message|
    @company = Company.find(message.company_id)
    text "Sent:", size: 14, style: :normal
    text "To: #{@company.name}", size: 14, style: :normal
    text  "Subject:#{message.subject}", size: 14, style: :normal
    text  "Content:#{message.text}", size: 14, style: :normal
    text  "Created at:#{message.created_at}", size: 14, style: :normal
    text  "Attachment:#{message.attachment}", size: 14, style: :normal
    move_down 10
    end

  end
end
