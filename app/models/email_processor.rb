class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    # all of your application-specific code here - creating models,
    # processing reports, etc

    # Here's an example of model creation
    user = User.find_by_email(@email.from[:email])
    user.posts.create!(
      subject: @email.subject,
      body: @email.body
    )
  end
end
