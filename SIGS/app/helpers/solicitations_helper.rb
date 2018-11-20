# frozen_string_literal: true

# Solicitations module
module SolicitationsHelper

  def validate_status_room(room_solicitation)
    if !room_solicitation.room_id.nil?
      1
    else
      0
    end
  end

  def validade_room_for_approve(room, room_solicitation)
    if room_solicitation.room_id.nil?
      room.id
    else
      room_solicitation.room_id
    end
  end

  def validate_for_save_solicitation(solicitation)
    solicitation.status = 1
    return unless solicitation.save
    flash[:success] = 'Solicitação aprovada com successo'
    redirect_to solicitations_index_path
  end

  def pass_to_all_allocation_dates_aux(allocation)
    pass_to_all_solicitations_helper(allocation)
  end




end
