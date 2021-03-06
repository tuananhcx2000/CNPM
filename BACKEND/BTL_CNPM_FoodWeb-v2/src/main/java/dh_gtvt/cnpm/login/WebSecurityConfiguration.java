package dh_gtvt.cnpm.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.stereotype.Component;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import dh_gtvt.cnpm.service.IUserService;

@Component
@EnableWebSecurity
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private IUserService service;
	
//	@Autowired
//	private IRefreshTokenService refreshTokenService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(service).passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.cors()
				.and()
				.authorizeRequests()
				.antMatchers("/api/v1/bill/**").hasAnyAuthority("User","Admin")
				.antMatchers("/api/v1/login").anonymous()
				.antMatchers("/api/v1/user/**").permitAll()
				.antMatchers("/api/v1/foods/**").anonymous()
				.antMatchers("/api/v1/foodcategory/**").anonymous()
				.anyRequest().authenticated()
				// .anyRequest().permitAll()
				.and()
				.httpBasic()
				.and()
				.csrf()
				.disable()
				.addFilterBefore(new JWTAuthenticationFilter("/api/v1/login", authenticationManager(), service),
						UsernamePasswordAuthenticationFilter.class)
				.addFilterBefore(new JWTAuthorizationFilter(service), 
						UsernamePasswordAuthenticationFilter.class);

	}
	@Bean
    CorsConfigurationSource corsConfigurationSource() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", new CorsConfiguration().applyPermitDefaultValues());
        return source;
    }
}