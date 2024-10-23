package org.youcode.controller;

import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.youcode.domain.Membre;
import org.youcode.services.MembreService;
import org.youcode.services.MembreServiceImp;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Optional;
import java.util.UUID;


@Controller
@RequestMapping("/membre")
public class MembreController {

    @Autowired
    private MembreService membreService;

//    @InitBinder
//    public void initBinder(WebDataBinder binder) {
//        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        binder.registerCustomEditor(LocalDate.class, "membershipDate", new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
//        binder.registerCustomEditor(LocalDate.class, "licenseExpiryDate", new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
//    }

    @GetMapping("/")
    public ModelAndView index() {
        return new ModelAndView("index");
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("membre", new Membre());
        return "createMembre";
    }

    @PostMapping("/save")
    public String saveMembre(@ModelAttribute Membre membre, RedirectAttributes redirectAttributes) {
        membre.setCreated_at(LocalDateTime.now());
        membreService.save(membre);
        redirectAttributes.addFlashAttribute("message", "Membre created successfully!");
        return "redirect:/membre/list";
    }

    @GetMapping("/list")
    public String listMembres(Model model) {
        model.addAttribute("membres", membreService.findAll());
        return "listMembre";
    }

    @PostMapping("/delete/{id}")
    public String deleteMember(@PathVariable UUID id, RedirectAttributes redirectAttributes) {
        System.out.println("Attempting to delete member with ID: " + id);
        try {
            membreService.deleteById(id);
            redirectAttributes.addFlashAttribute("message", "Membre deleted successfully!");
        } catch (EntityNotFoundException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "An error occurred while deleting the member.");
            e.printStackTrace();
        }
        return "redirect:/membre/list";
    }






    @PostMapping("/update")
    public String updateMembre(@ModelAttribute Membre membre, RedirectAttributes redirectAttributes) {
        membreService.save(membre); // Ensure this saves the updated membre
        redirectAttributes.addFlashAttribute("message", "Membre updated successfully!");
        return "redirect:/membre/list";
    }



    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") UUID id, Model model, RedirectAttributes redirectAttributes) {
        Optional<Membre> membreOptional = membreService.findById(id);
        if (membreOptional.isPresent()) {
            model.addAttribute("membre", membreOptional.get());
            return "editMembre";
        } else {
            redirectAttributes.addFlashAttribute("error", "Membre not found.");
            return "redirect:/membre/list";
        }
    }




}
