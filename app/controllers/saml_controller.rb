class SamlController < ApplicationController
  skip_before_action :verify_authenticity_token
    def initiate
      settings = saml_settings

      request = OneLogin::RubySaml::Authrequest.new
      redirect_to request.create(settings), allow_other_host: true
    end

    def consume
      response = OneLogin::RubySaml::Response.new(params[:SAMLResponse],settings: saml_settings)
      # debugger
      if response.is_valid?
        # Process the authenticated user here
        # debugger
        email = response.attributes['email']
        name = response.attributes["http://schemas.microsoft.com/identity/claims/displayname"]
        # debugger
        # Sign in the user or create a new account
        render json: { message: "Successfully logged in as #{name}." }
      else
        Rails.logger.error "SAML response validation failed: #{response.errors}"
        render json: { message: 'Invalid SAML response.' }, status: :unprocessable_entity
      end
      # render json: {status: "working"}
    end

    def metadata
      settings = saml_settings
      meta = OneLogin::RubySaml::Metadata.new
      metadata = meta.generate(settings)

      response.headers['Content-Type'] = 'application/xml'
      response.headers['Content-Disposition'] = 'attachment; filename="metadata.xml"'

      render xml: metadata
    end

    private

    def saml_settings
      settings = OneLogin::RubySaml::Settings.new

      settings.idp_entity_id = 'https://sts.windows.net/f99bd4e3-9b85-4899-87d0-75ad4473ef9f/'
      settings.idp_sso_target_url = 'https://login.microsoftonline.com/f99bd4e3-9b85-4899-87d0-75ad4473ef9f/saml2'
      settings.idp_cert = File.read('E:\testApp\app\assets\Azure_saml (1).pem')
      settings.sp_entity_id = 'http://localhost:3000'
      settings.assertion_consumer_service_url = 'http://localhost:3000/abs/saml/consume'
      settings.name_identifier_format = 'urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified'
      settings.single_logout_service_binding      = "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect" # or :post, :redirect
      settings.assertion_consumer_service_binding = "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
      settings.security[:authn_requests_signed] = true
      settings.security[:logout_requests_signed] = true
      settings.security[:logout_responses_signed] = true
      settings.security[:metadata_signed] = true
    
      settings.security[:embed_sign] = true


      return settings
    end

end
