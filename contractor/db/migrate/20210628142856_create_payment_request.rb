class CreatePaymentRequest < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_requests, id: :uuid do |t|
      t.integer :amount
      t.string :currency
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
