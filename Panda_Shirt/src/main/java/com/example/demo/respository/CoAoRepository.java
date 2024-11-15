package com.example.demo.respository;

import com.example.demo.entity.CoGiay;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CoAoRepository extends JpaRepository<CoGiay,Integer> {
    boolean existsCoAoByMa(String ma);
    boolean existsCoAoByTen(String ten);
    Optional<CoGiay> findByTen(String name);

    @Query("SELECT ca FROM CoGiay ca WHERE " +
            "(?1 IS NULL OR ca.ten LIKE %?1%) AND " +
            "(?2 IS NULL OR ca.trangThai = ?2)")
    Page<CoGiay> findByTenAndTrangthaiCA(String tenca, Integer trangThai, Pageable pageable);

}
