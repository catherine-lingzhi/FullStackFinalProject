ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :subtotal, :user_id, :order_status_id, :payment_id, product_ids: []
  permit_params :subtotal, :user_id, :order_status_id, :subtotal, :payment_id, product_ids:   [],
                                                                               order_details: %i[id quantity price product_id]

  form do |f|
    f.inputs "Order Details" do
      f.object.order_details.build unless f.object.order_details.present?

      f.has_many :order_details, allow_destroy: true do |od|
        od.input :quantity
        od.input :product_id, as: :select, collection: Product.all, include_blank: "Select Product"
        od.input :_destroy, as: :boolean, required: false, label: "Remove" if od.object.present?
      end
    end

    f.inputs "Order Summary" do
      f.input :subtotal
      f.input :user_id
      f.input :order_status_id
      f.input :payment_id
    end

    f.actions
  end
end
