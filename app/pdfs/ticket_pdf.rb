class TicketPdf < Prawn::Document
  def initialize(ticket, view)
    super()
    @ticket = ticket
    @view = view
    logo
    deliver_details
    ticket_details
  end
  def logo
    logopath =  "#{Rails.root}/app/assets/images/logo.png"
    image logopath, :width => 150, :height => 70
    move_down 10
    draw_text "Ticket Details", :at => [220, 675], size: 22
  end
  def deliver_details
    move_down 60
    text "Ticket Number:
   #{@ticket.job_ticket_no} ", :size => 13
    move_down 20
    text "Expected Delivey Date:
   #{@ticket.expected_deliver_date} ", :size => 13
  end
  def ticket_details    
  	move_down 60
  	ticket_number = @ticket.job_ticket_no
    product = @ticket.product.name if @ticket.product
    priority = @ticket.priority.name if @ticket.priority
    brand = @ticket.brand.name if @ticket.brand
    client = @ticket.client.client_name if @ticket.client
    project = @ticket.project.name if @ticket.client
  	table ([["Ticket No",  "#{ticket_number} "] ,
    ["Client", "#{client} "],
    ["Project", "#{project} "],
    ["Product", "#{product} "],
    ["Priority", "#{priority}"],
    ["Brand", "#{brand}"],
    
    ]),
	:width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 200, 3 => 100}
      columns(2).font_style = :bold
    end
  end
end