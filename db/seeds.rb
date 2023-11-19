require "net/http"
require "json"
require "uri"

# Product.delete_all
# Category.delete_all

# # Helper function to validate image link
# def valid_image_link?(image_link)
#   uri = URI(image_link)
#   response = Net::HTTP.get_response(uri)
#   response.code.to_i == 200
# rescue Errno::ECONNREFUSED, SocketError
#   puts "Error: Failed to connect to the image link: #{image_link}"
#   false
# end

# # Helper function to check if description contains HTML tag
# def description_has_html_tag?(description)
#   !!(description =~ %r{</?[a-z][\s\S]*>})
# end

# # Fetch API to populate data to the database
# url = "http://makeup-api.herokuapp.com/api/v1/products.json"
# uri = URI(url)
# response = Net::HTTP.get(uri)
# data = JSON.parse(response)

# # Counter to limit the number of products
# products_created = 0
# desired_product_limit = 200

# data.each do |product_data|
#   break if products_created >= desired_product_limit

#   category = Category.find_or_create_by(name: product_data["product_type"])

#   if category && category.valid?
#     image_link = product_data["image_link"]

#     if valid_image_link?(image_link) && !description_has_html_tag?(product_data["description"])
#       # db/seeds.rb
#       product = category.products.create(
#         name:        product_data["name"],
#         price:       product_data["price"],
#         image_link:,
#         description: product_data["description"]
#       )

#       products_created += 1
#     else
#       puts "Invalid image link: #{image_link}"
#     end
#   else
#     puts "Invalid category #{product_data['product_type']}"
#   end
# end

# puts "Created #{Category.count} categories"
# puts "Created #{Product.count} products"

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end
