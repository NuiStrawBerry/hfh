package com.hfh.web;


import java.io.UnsupportedEncodingException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value="/form")
public class TestFormController {
	// Invoked on every request


		// Invoked initially to create the "form" attribute
		// Once created the "form" attribute comes from the HTTP session (see @SessionAttributes)

		@ModelAttribute("formBean")
		public FormBean createFormBean() {
			return new FormBean();
		}
		
		public void form(Model m) {
			System.out.println("aaaaaa");
			m.addAttribute("feedback", "feedback");
		}

		@RequestMapping(method=RequestMethod.POST)
		public String processSubmit(FormBean formBean, BindingResult result, 
									@ModelAttribute("ajaxRequest") boolean ajaxRequest, 
									Model model, RedirectAttributes redirectAttrs) {
			if (result.hasErrors()) {
				return null;
			}
			// Typically you would save to a db and clear the "form" attribute from the session 
			// via SessionStatus.setCompleted(). For the demo we leave it in the session.
			String message = "Form submitted successfully.  Bound " + formBean;
			// Success response handling
			if (ajaxRequest) {
				// prepare model for rendering success message in this request
				model.addAttribute("message", message);
				model.addAttribute("feedback", "feedback");
				return null;
			} else {
				// store a success message for rendering on the next request after redirect
				// redirect back to the form to render the success message along with newly bound values
				redirectAttrs.addFlashAttribute("message", message);
				redirectAttrs.addFlashAttribute("feedback");
				return "redirect:/form";			
			}
		}
		
		
		
}
