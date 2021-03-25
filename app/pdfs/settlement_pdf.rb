class SettlementPdf
  include Prawn::View
  include WhatMonth

  def initialize(language, settlement)
    @settlement = settlement
    @language = language
    @date = Time.now
    check_settlement_language
  end

  def check_settlement_language
    if @language == "es"
      generate_settlement_es
    else
      generate_settlement_en
    end
  end

  def generate_settlement_es
    logo
    content_es
  end

  def generate_settlement_en
    logo
    content_en
  end

  def logo
    bounding_box([0, cursor], width: 535, height: 82) do
      image "app/assets/images/equinox_logo.png", at: [390, 82], width: 160
    end
  end

  def content_es
    text "<b><u>Acta Entrega de Llaves</u></b>", inline_format: true, align: :center
    move_down 10
    default_leading 2
    text "I.- Que en fecha <b>#{@settlement.booking.start_date.to_date.strftime('%d/%m/%Y')}</b>, se suscribió el contrato de arrendamiento de vivienda amueblada, sita en Barcelona, <b>#{@settlement.booking.flat.full_address}</b>, entre <b>#{@settlement.booking.flat.landlord.full_name}</b>, con #{@settlement.booking.flat.landlord.id_type} nº <b>#{@settlement.booking.flat.landlord.id_number}</b>, en calidad de Arrendador y <b>#{@settlement.booking.tenant.full_name}</b>, con #{@settlement.booking.tenant.id_type} nº <b>#{@settlement.booking.tenant.id_number}</b> en calidad de Arrendataria/o.", inline_format: true
    move_down 8
    text "II.- Que, en fecha del presente documento, ha finalizado dicho contrato de arrendamiento y se materializa mediante la entrega de la posesión de la vivienda a la Arrendadora, con la entrega de las llaves, quien recibe:"
    move_down 8
    text "Llave:", indent_paragraphs: 40
    move_down 8
    text "Llave:", indent_paragraphs: 40
    move_down 8
    text "Llave:", indent_paragraphs: 40
    move_down 8
    text "III.- Que la vivienda ha sido desocupada previamente por la parte Arrendataria, y por tanto se encuaentra: "
    move_down 8
    text "- Libre de objetos personales para la entrega.", indent_paragraphs: 40
    move_down 8
    text "- Con los siguientes aspectos a revisar:", indent_paragraphs: 40
    move_down 10
    text "____________________________________________________________", indent_paragraphs: 60
    move_down 10
    text "____________________________________________________________", indent_paragraphs: 60
    move_down 10
    text "____________________________________________________________", indent_paragraphs: 60
    move_down 10
    text "____________________________________________________________", indent_paragraphs: 60
    move_down 15
    text "IV.- Que el Arrendador y/o su representante acepta dicha entrega, procediendo, seguidamente, a la inspección de la vivienda a los efectos de constatar el estado de la misma en el momento en el que la recibe, por lo que notificará a la parte Arrendataria su resultado y posteriormente, se procederá a la liquidación de la fianza."
    move_down 8
    text "V.- Que la fianza despositada en el Institut Catalá del Sòl (Incasol) por importe de <b>#{@settlement.booking.deposit.amount} €</b> y con número de registro <b>#{@settlement.booking.deposit_registry}</b>, será solicitada por la Arrendadora a dicho organismo, tras la firma del presente documento.", inline_format: true
    move_down 10
    text "Y para que conste, firma el presente documento en la ciudad y fecha indicadas a continuación."
    move_down 8
    text "En Barcelona #{@date.day} de #{month_in_es(@date.month)} de #{@date.year}"
    draw_text "PARTE ARRENDATARIA", at: [350, 5], size: 10, style: :bold
  end

  def content_en
    text "<b><u>Check-out Certificate</u></b>", inline_format: true, align: :center
    move_down 10
    default_leading 2
    text "I.- That on the <b>#{@settlement.booking.start_date.to_date.strftime('%d/%m/%Y')}</b>, _, an agreement for the rental of a furnished apartment, located in Barcelona, <b>#{@settlement.booking.flat.full_address}</b>, was signed between Mr/Mrs <b>#{@settlement.booking.flat.landlord.full_name}</b>, with #{@settlement.booking.flat.landlord.id_type} nº <b>#{@settlement.booking.flat.landlord.id_number}</b>, hereinafter 'the Lessors' and Mr/Mrs <b>#{@settlement.booking.tenant.full_name}</b>, with #{@settlement.booking.tenant.id_type} nº <b>#{@settlement.booking.tenant.id_number}</b> hereinafter 'the Lessee'.", inline_format: true
    move_down 8
    text "II.- That, on the present date, the above leasing agreement ends. Such termination being confirmed by the handing over of the property's possession and sets of keys to the Landlord who by these means receives:"
    move_down 8
    text "Llave:", indent_paragraphs: 40
    move_down 8
    text "Llave:", indent_paragraphs: 40
    move_down 8
    text "Llave:", indent_paragraphs: 40
    move_down 8
    text "III.- That the property subject matter of the signed leasing agreement has been previously vacated by the Lessee, and therefore is handed over to the Lessor:"
    move_down 8
    text "- Free of any personal belongings", indent_paragraphs: 40
    move_down 8
    text "- With the followings aspects to be verified:", indent_paragraphs: 40
    move_down 10
    text "____________________________________________________________", indent_paragraphs: 60
    move_down 10
    text "____________________________________________________________", indent_paragraphs: 60
    move_down 10
    text "____________________________________________________________", indent_paragraphs: 60
    move_down 10
    text "____________________________________________________________", indent_paragraphs: 60
    move_down 15
    text "IV.- That the Lessor and/or his representative accepts the handing over of the property and procedes to its inspection, as to confirm its state of the maintenance at the time of the check-out procedure and will notify the Lessee of the inspection result for the settlement of the security deposit paid by the Lessee upon arrival."
    move_down 8
    text "V.- That the amount deposited in the Institut Català del Sòl (Incasol) with registration number <b>#{@settlement.booking.deposit_registry}</b>, for a total of <b>#{@settlement.booking.deposit.amount}</b> € will be requested by the Lessee, after signature of the present document.", inline_format: true
    move_down 10
    text "And for the record, this document is duly signed in the city and date indicated below."
    move_down 8
    text "In Barcelona on the #{@date.strftime('%d/%m/%Y')}"
    draw_text "THE LESSEE PARTY", at: [350, 5], size: 10, style: :bold
  end
end
