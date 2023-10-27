module ControllerHelpers
  def tenant_login(tenant)
    payload = { tenant_id: tenant.id }
    session = JWTSessions::Session.new(payload: payload)
    @tokens = session.login
  end
end
