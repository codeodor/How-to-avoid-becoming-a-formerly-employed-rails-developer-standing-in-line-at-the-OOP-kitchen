class Registrar
  def register(requester, registration_info, group_info, scholarship)  
    registration = Registration.new(registration_info)
    set_user_and_registration_fee(registration, requester)
    set_study_group(registration, group_info)
    account_for_scholarship(registration, scholarship)
    registration.save
    return registration
  end
  
  private
  def set_user_and_registration_fee(reg, user)
    unless user && user.admin?
      reg.registration_fee = reg.section.registration_fee 
      reg.user = user
    end
  end
  
  def set_study_group(reg, attrs)
    if attrs && !reg.study_group_id
      new_group = StudyGroup.create(attrs)
      reg.study_group = new_group if new_group.valid?
    end  
  end
  
  def account_for_scholarship(reg, scholarship)
    code = ScholarshipCode.for_department_with_code(reg.section.course.department, scholarship)
    reg.scholarship_code = code
    reg.registration_fee -= code.value(reg.registration_fee) if code
  end
end