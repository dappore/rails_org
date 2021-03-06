class DinnerExport
  extend RailsData::Export

  config do
    collect -> (params){ Dinner.default_where(params) }
    column :name, header: '名称', field: -> (o){ o.name }
    column :count, header: '订单数', field: -> (o){ o.today_order_items_count }
    column :people, header: '人员', field: -> (o, day: Date.today){
      orders = o.orders.default_where('created_at-gte': day.at_beginning_of_day, 'created_at-lte': day.end_of_day)
      Member.where(id: orders.pluck(:user_id)).pluck(:name).join(', ')
    }
  end

end
