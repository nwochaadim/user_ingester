module UsersHelper

  def build_csv_text(name: "Coy", email: "em@email.com", telephone: "123456",
                     website: "www.coy.com")
    "Name,Email Address,Telephone Number,Website\n" \
    "#{name},#{email},#{telephone},#{website}"
  end

end
