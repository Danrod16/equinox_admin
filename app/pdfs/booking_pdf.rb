class BookingPdf
  include Prawn::View
  include WhatMonth

  def initialize(language, booking, signature)
    @booking = booking
    @language = language
    @date = Time.now
    @signature = signature
    check_booking_language
  end

  def check_booking_language
    if @language == "es"
      generate_booking_es
    else
      generate_booking_eng
    end
  end

  def generate_booking_es
    logo
    content_es
    # signature
    footer_es
  end

  def generate_booking_eng
    logo
    content_eng
    # signature
    footer_eng
  end

  def logo
    bounding_box([0, cursor], width: 535, height: 82) do
      image "app/assets/images/equinox_logo.png", at: [390, 82], width: 160
    end
  end


  # def signature
  #   if @signature.attached?
  #     bounding_box([0, cursor], width: 535, height: 82) do
  #       image StringIO.open(@signature&.download), at: [15, 50], width: 100
  #     end
  #   end
  # end

  def content_es
    text "En Barcelona #{@date.day} de #{month_in_es(@date.month)} de #{@date.year}"
    move_down 10
    default_leading 2
    text "<b>URBAN EQUINOX S.L.</b> con CIF Nº B66863614 y en su representación Adriana Romero Rule con número DNI 54894231Q, actuando en representación del propietario de la vivienda sita en #{@booking.flat.full_address} y como Comercializador ejerce la promoción de la vivienda en régimen de alquiler de temporada.",inline_format: true
    move_down 10
    text "<b>Documento de Reserva - Arrendamiento de vivienda</b>", inline_format: true, align: :center
    move_down 10
    text "<b>#{@booking.tenant.full_name}</b> de nacionalidad #{@booking.tenant.nationality} con #{@booking.tenant.id_type} Nº #{@booking.tenant.id_number} en adelante ARRENDATARIO abona la cantidad de <b>#{@booking.deposit.token_payment}€</b> en concepto de reserva. Dicha reserva se ha transferido a la cuenta del propietario y se aplicará a la fianza pactada.", inline_format: true
    move_down 10
    text "1.  El contrato de alquiler inicia el #{@booking.start_date.to_date} y finaliza el #{@booking.end_date.to_date} período de obligado cumplimiento. El contrato tendrá una validez de #{@booking.payments} meses."
    text "2.  Urban Equinox percibirá en concepto de honorarios por parte del ARRENDATARIO, <b>#{@booking.agency_fee}€</b> más IVA(21%), previa emisión y recepción de factura.", inline_format: true
    text "3.  La renta pactada es de <b>#{@booking.rent}€</b> al mes. Los gastos de comunidad e IBI están incluidos en el importe de alquiler. Los consumos de agua, luz y gas corren por cuenta del ARRENDATARIO. La fianza legal <b>#{@booking.deposit.amount}€</b>. Al finalizar el contrato se pagará una limpieza del piso y el importe total será facturado y descontado de la fianza.", inline_format: true
    text "4.  Se cubre un importe por ITP(Impuesto de Transmisiones Patrimonionales) de <b>#{@booking.itp}€</b>.", inline_format: true
    text "5.  En caso de no formalizarse el contrato por causa imputable al ARRENDATARIO durante los próximos 2 días hábiles, éste perderá el 100% de la cantidad entregada en concepto de reserva."
    text "6.  En caso de no formalizarse el contrato de arrendamiento por causa imputable al arrendador y/o durante los próximos 2 días hábiles. Urban Equinox S.L. en nombre del propietario devolverá la cantidad total pagada como reserva en un plazo de 5 días hábiles tras la comunicación de no aceptación de arrendamiento."
    move_down 10
    text "El presente documento de reserva ha sido pactado y negociado por las partes de forma expresa, individual, y detallada en todos sus puntos y para que así conste y en prueba de conformidad de cuanto antecede, las partes lo firma por duplicado ejemplar y a un solo efecto, en el lugar y fecha indicados en el encabezamiento."
    draw_text "AGENTE", at: [40, 120]
    draw_text "CLIENTE", at: [440, 120]
  end

  def content_eng
    text "<b>Reservation Document</b>", inline_format: true, align: :center
    move_down 15
    text "Barcelona on the #{@date.day} of #{month_in_es(@date.month)} de #{@date.year}"
    move_down 10
    default_leading 2
    text "<b>URBAN EQUINOX S.L.</b> with CIF nr. B66863614 and on its behalf, Adriana Romero Rule with DNI nr. 54894231Q acting as Real Estate Agency commercializing the Owner's property , hereinafter the OWNER, located at <b>#{@booking.flat.full_address}</b>, hereinafter referred to as the AGENCY.", inline_format: true
    move_down 10
    text "<b>CERTIFIES</b> that Mr/Mrs <b>#{@booking.tenant.full_name}</b> hereinafter referred to as the CLIENT, citizen of <b>#{@booking.tenant.nationality}</b> with #{@booking.tenant.id_type} nr. <b>#{@booking.tenant.id_number}</b> has paid, via bank transfer to the AGENCY's bank account, the amount of <b>#{@booking.deposit.token_payment} EUROS</b> as reservation fee. Such amount shall be part of the agreed security deposit amount.", inline_format: true
    move_down 10
    bounding_box([35, 445], width: 505, height: 260) do
      text "The rental agreement will begin on the <b>#{@booking.start_date.to_date}</b> and will end on the <b>#{@booking.end_date.to_date}</b> for a total of <b>#{@booking.payments}</b> months of compulsory nature. The utilities will amount <b>#{@booking.appliences} EUROS</b>.", inline_format: true
      move_down 5
      text "The agreed rental will amount to <b>#{@booking.rent} EUROS</b> per month. The security deposit will amount to <b>#{@booking.deposit.amount} EUROS</b> and the ITP (Property Transfer Tax) to <b>#{@booking.itp} EUROS</b>.", inline_format: true
      move_down 5
      text "The AGENCY will receive from the CLIENT, the amount of <b>#{@booking.agency_fee} EUROS</b> plus 21% VAT, for its intermediation. Such amount shall be paid by the CLIENT before the signature of the rental agreement or at the latest, on the same day.", inline_format: true
      move_down 5
      text "If the contract is not formalized for any reasons attributable to the CLIENT during the 48 hours which follow signature of the present document, the latter will lose 100% of the amount paid to the AGENCY."
      move_down 5
      text "In the event that the lease is not formalized for reasons attributable to the OWNER and/or during the next 2 business days, the AGENCY will refund, on behalf of the OWNER, the total reservation fee paid by the CLIENT,within the following 5 business days after notice of non-acceptance of the Lease by the OWNER is received."
    end
    bounding_box([20, 445], width: 15, height: 260) do
      text "1."
      move_down 22
      text "2."
      move_down 21
      text "3."
      move_down 37
      text "4."
      move_down 36
      text "5."
    end
    text "This reservation document has been agreed and negotiated by the parties expressly, individually, and in detail in all its points and for the record and proof of conformity of the foregoing, the parties sign it in duplicate in the place and date indicated in the heading."
    draw_text "AGENTE", at: [40, 110]
    draw_text "CLIENTE", at: [440, 110]
  end

  def footer_es
    bounding_box([0, 90], width: 535, height: 90) do
      image "app/assets/images/equinox_logo.png", position: :center, width: 108
      text "<b>INFORMACION DE PROTECCION DE DATOS</b>", inline_format: true, align: :center, size: 10
      font_size 8
      text "Servicios inmoniliarios Barcelona-Madrid España", inline_format: true, align: :center
      text "Calle Ronda Sant Pere 40,1-1 Barcelona     Tel.+34 93 140 26 20     Mov. +34 693 808 511     CIF B66863614     AICAT 7838", align: :center
    end
  end

  def footer_eng
    bounding_box([0, 90], width: 535, height: 90) do
      image "app/assets/images/equinox_logo.png", position: :center, width: 108
      text "<b>INFORMACION DE PROTECCION DE DATOS</b>", inline_format: true, align: :center, size: 10
      font_size 8
      text "Servicios inmoniliarios Barcelona-Madrid España", inline_format: true, align: :center
      text "Calle Ronda Sant Pere 40,1-1 Barcelona     Tel.+34 93 140 26 20     Mov. +34 693 808 511     CIF B66863614     AICAT 7838", align: :center
    end
  end
end
