class ReceiptPdf
  include Prawn::View
  include WhatMonth
  
  def initialize(receipt)
    @receipt = receipt
    generate_receipt
  end
  
  def generate_receipt
    header
    content
  end
  
  def header
    bounding_box([0, cursor], width: 535, height: 82) do
      text "EUROMIDE S.A.", style: :bold
      move_down 8
      text "CARRER DE MALLORCA 272 4 - 7", leading: 2
      text "08037 Barcelona - España"
      text "NIF: A59952374", leading: 2
    end
  end

  def content
    text "RECIBO", align: :center, size: 16
    draw_text "Fecha", at: [400, 585]
    bounding_box([440, 600], width: 100, height: 20) do
      text "#{Time.now.strftime("%d/%m/%Y")}", align: :center, valign: :center, character_spacing: 1
      stroke_bounds
    end
    move_down 30
    text "Cliente:  #{@receipt.booking.tenant.full_name}", leading: 2
    text "Dirección:  #{@receipt.booking.tenant.full_address}", leading: 2
    text "NIF:  #{@receipt.booking.tenant.cif}", leading: 2
    bounding_box([0, 440], width: 540, height: 100) do
      bounding_box([0,100], width: 540, height: 20) do
        bounding_box([0,20], width: 300, height: 20) do
          text "CONCEPTO", character_spacing: 1, valign: :center, align: :center
        end
        bounding_box([420,20], width: 120, height: 20) do
          text "IMPORTE", character_spacing: 1, valign: :center, align: :center
        end
        stroke_bounds
      end
      move_down 10
      text "Honorarios correspondientes al alquiler del mes de #{month_in_es(Time.now.month).capitalize} #{Time.now.year}, de la vivienda", indent_paragraphs: 5
      move_down 5
      text "en #{ @receipt.booking.flat.full_address}", indent_paragraphs: 5
      text_box "#{@receipt.booking.rent} €", at: [390, 60], width: 140, height: 100, align: :right
      stroke_bounds
    end
    bounding_box([270, 320], width: 180, height: 120) do
      move_down 3
      text "TOTAL", align: :right, style: :bold
    end
    bounding_box([450, 320], width: 80, height: 120) do
      move_down 3
      text "#{@receipt.booking.rent} €", align: :right, style: :bold
    end
  end
end
