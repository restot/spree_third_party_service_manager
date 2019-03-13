class CreateSpreePagesRoute < SpreeExtension::Migration[4.2]
  def change
    create_table :spree_pages_route do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
