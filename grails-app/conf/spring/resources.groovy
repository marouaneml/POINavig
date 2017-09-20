import m2.mbds.projet.grails.poinavig.UserPasswordEncoderListener
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler
// Place your Spring DSL code here
beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener, ref('hibernateDatastore'))
}
