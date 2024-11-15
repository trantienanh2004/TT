package com.example.demo.Controller.admin.QLSP;

import com.example.demo.entity.CoGiay;
import com.example.demo.respository.CoAoRepository;
import com.example.demo.service.CoAoService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;

@Controller
@RequestMapping("/panda/coao")
public class CoGiayController {
    @Autowired
    CoAoRepository coAoRepository;
    @Autowired
    CoAoService coAoService;
    @GetMapping("/hienthi")
    public String index( @RequestParam(value = "page", defaultValue = "0") int page,
                         @RequestParam(value = "tenca", required = false) String tenca,
                         @RequestParam(value = "trangthai", required = false) Integer trangthai,
                         Model model) {
        String role = "admin"; //Hoặc lấy giá trị role từ session hoặc service
        model.addAttribute("role", role);

        if (page < 0) {
            page = 0;
        }
        Page<CoGiay> listCA = coAoService.hienThiCA(page, tenca, trangthai);
        model.addAttribute("totalPage", listCA.getTotalPages());
        model.addAttribute("currentPage", page);
        model.addAttribute("tenca", tenca);
        model.addAttribute("trangthai", trangthai);
        model.addAttribute("list", listCA.getContent());
        model.addAttribute("CoAo", new CoGiay());
        model.addAttribute("pageSize", listCA.getSize());
        return "admin/QLSP/CoAo";
    }

    @GetMapping("/add")
    public String showFormAdd(Model model) {
        String role = "admin"; //Hoặc lấy giá trị role từ session hoặc service
        model.addAttribute("role", role);
        model.addAttribute("coAo", new CoGiay());
        CoGiay coGiay = new CoGiay();
        coGiay.setTrangThai(0); // Giá trị mặc định là 0 (Hoạt động)
        model.addAttribute("coAo", coGiay);
        return "admin/QLSP/ADD/addCoAo";
    }

    @PostMapping("/add")
    public String add(Model model, @Valid @ModelAttribute CoGiay coGiay, BindingResult result, RedirectAttributes redirectAttributes) {
        String role = "admin";
        model.addAttribute("role", role);

        // Kiểm tra lỗi trong binding
        if (result.hasErrors()) {
            return "admin/QLSP/ADD/AddCoAo"; // Trả về trang thêm mới nếu có lỗi
        }

        // Kiểm tra mã đã tồn tại
        if (coAoRepository.existsCoAoByMa(coGiay.getMa())) {
            model.addAttribute("errorma", "Mã đã tồn tại");
            return "admin/QLSP/ADD/AddCoAo";
        }

        // Kiểm tra tên đã tồn tại
        if (coAoRepository.existsCoAoByTen(coGiay.getTen())) {
            model.addAttribute("errorten", "Tên đã tồn tại");
            return "admin/QLSP/ADD/AddCoAo";
        }

        // Nếu ID không phải là null, thực hiện cập nhật
        if (coGiay.getId() != null) {
            CoGiay existingCoGiay = coAoRepository.findById(coGiay.getId()).orElse(null);
            if (existingCoGiay != null) {
                existingCoGiay.setMa(coGiay.getMa());
                existingCoGiay.setTen(coGiay.getTen());
                existingCoGiay.setTrangThai(coGiay.getTrangThai());
                existingCoGiay.setNgaySua(LocalDateTime.now());
                coAoRepository.save(existingCoGiay);
            } else {
                redirectAttributes.addFlashAttribute("ErrorStatusMessage", "Thêm không thành công!");
                return "redirect:/panda/coao/hienthi"; // Redirect sau khi có lỗi
            }
        } else {
            // Thêm mới
            coGiay.setNgayTao(LocalDateTime.now());
            coGiay.setNgaySua(LocalDateTime.now());
            coAoRepository.save(coGiay);
        }

        // Thêm thông báo thành công
        redirectAttributes.addFlashAttribute("AddStatusMessage", "Thêm thành công !");
        return "redirect:/panda/coao/hienthi";
    }

    @GetMapping("/update")
    public String showFormUpdate(Model model, @RequestParam("id") Integer id) {
        String role = "admin"; //Hoặc lấy giá trị role từ session hoặc service
        model.addAttribute("role", role);
        model.addAttribute("coAo", new CoGiay());
        model.addAttribute("coAo", coAoRepository.findById(id).get());
        return "admin/QLSP/UPDATE/UpdateCoAo";
    }

    @PostMapping("/update")
    public String update(@Validated @ModelAttribute CoGiay coGiay, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {
        String role = "admin";
        model.addAttribute("role", role);
        if (bindingResult.hasErrors()) {
            return "admin/QLSP/UPDATE/UpdateCoAo";
        }

        // Nếu ID không phải là null, thực hiện cập nhật
        if (coGiay.getId() != null) {
            CoGiay existingCoGiay = coAoRepository.findById(coGiay.getId()).orElse(null);
            if (existingCoGiay != null) {
                existingCoGiay.setMa(coGiay.getMa());
                existingCoGiay.setTen(coGiay.getTen());
                existingCoGiay.setTrangThai(coGiay.getTrangThai());
                existingCoGiay.setNgaySua(LocalDateTime.now());
                coAoRepository.save(existingCoGiay);
            } else {
                redirectAttributes.addFlashAttribute("ErrorStatusMessage", "Thêm không thành công!");
                return "redirect:/panda/coao//hienthi"; // Redirect sau khi có lỗi
            }
        } else {
            // Thêm mới
            coGiay.setNgayTao(LocalDateTime.now());
            coGiay.setNgaySua(LocalDateTime.now());
            coAoRepository.save(coGiay);
        }
        redirectAttributes.addFlashAttribute("UpdateStatusMessage", "Cập nhật thành công !");
        return "redirect:/panda/coao//hienthi";
    }
    @GetMapping("/change")
    public String changeStatus(@RequestParam("id") int id, Model model, RedirectAttributes redirectAttributes) {
        String role = "admin"; // Hoặc lấy giá trị role từ session hoặc service
        model.addAttribute("role", role);

        CoGiay coGiay = coAoRepository.findById(id).orElse(null);
        if (coGiay != null) {
            coGiay.setTrangThai(coGiay.getTrangThai() == 1 ? 0 : 1); // Đảo ngược trạng thái
            coAoRepository.save(coGiay);
        }
        redirectAttributes.addFlashAttribute("ChangesStatusMessage", "Chuyển trạng thái thành công !");
        return "redirect:/panda/coao/hienthi";
    }
}
