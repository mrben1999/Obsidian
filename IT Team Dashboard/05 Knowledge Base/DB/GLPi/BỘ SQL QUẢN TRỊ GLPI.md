---
type: knowledge
tags:
  - knowledge
area:
author:
created: 2026-07-27
related:
---
-- =====================================================================
-- BỘ SQL QUẢN TRỊ GLPI (~50 câu) - dựa trên schema glpi.sql (bản mới nhất)
-- Dùng cho: báo cáo, export Excel, làm nguồn dữ liệu Power BI
-- Ghi chú:
--   - GLPI không có khái niệm "Department" riêng, người ta thường dùng
--     Entity (glpi_entities) hoặc Group (glpi_groups) để thể hiện phòng ban.
--     Các câu "theo Department" dưới đây dùng Entity, có 1 câu dùng Group.
--   - "USB" trong GLPI được quản lý dưới dạng Peripheral (glpi_peripherals),
--     gắn vào Computer qua bảng glpi_assets_assets_peripheralassets.
--   - Toàn bộ query có is_deleted = 0 để loại tài sản đã xoá (thùng rác).
-- =====================================================================


-- #####################################################################
-- A. COMPUTER + THIẾT BỊ NGOẠI VI (MONITOR / PERIPHERAL / USB)
-- #####################################################################

-- 1. Danh sách Computer kèm Monitor đang gắn kèm
SELECT
    c.id            AS computer_id,
    c.name          AS computer_name,
    m.id            AS monitor_id,
    m.name          AS monitor_name,
    m.serial        AS monitor_serial
FROM glpi_computers c
JOIN glpi_assets_assets_peripheralassets rel
    ON rel.itemtype_asset = 'Computer'
   AND rel.items_id_asset = c.id
   AND rel.itemtype_peripheral = 'Monitor'
   AND rel.is_deleted = 0
JOIN glpi_monitors m
    ON m.id = rel.items_id_peripheral
   AND m.is_deleted = 0
WHERE c.is_deleted = 0
ORDER BY c.name;


-- 2. Danh sách Monitor CHƯA gắn với Computer nào (kể cả monitor dùng chung is_global)
SELECT
    m.id, m.name, m.serial, m.locations_id, s.name AS state_name
FROM glpi_monitors m
LEFT JOIN glpi_states s ON s.id = m.states_id
WHERE m.is_deleted = 0
  AND m.id NOT IN (
      SELECT items_id_peripheral
      FROM glpi_assets_assets_peripheralassets
      WHERE itemtype_peripheral = 'Monitor' AND is_deleted = 0
  )
ORDER BY m.name;


-- 3. Danh sách Computer kèm Peripheral (chuột/USB/bàn phím/thiết bị ngoại vi)
SELECT
    c.id            AS computer_id,
    c.name          AS computer_name,
    p.name          AS peripheral_name,
    pt.name         AS peripheral_type,
    p.serial        AS peripheral_serial
FROM glpi_computers c
JOIN glpi_assets_assets_peripheralassets rel
    ON rel.itemtype_asset = 'Computer'
   AND rel.items_id_asset = c.id
   AND rel.itemtype_peripheral = 'Peripheral'
   AND rel.is_deleted = 0
JOIN glpi_peripherals p ON p.id = rel.items_id_peripheral AND p.is_deleted = 0
LEFT JOIN glpi_peripheraltypes pt ON pt.id = p.peripheraltypes_id
WHERE c.is_deleted = 0
ORDER BY c.name;


-- 4. Chỉ lấy các Peripheral có loại chứa từ khóa "USB" gắn vào Computer
SELECT
    c.name  AS computer_name,
    p.name  AS usb_device_name,
    pt.name AS peripheral_type
FROM glpi_computers c
JOIN glpi_assets_assets_peripheralassets rel
    ON rel.itemtype_asset = 'Computer'
   AND rel.items_id_asset = c.id
   AND rel.itemtype_peripheral = 'Peripheral'
   AND rel.is_deleted = 0
JOIN glpi_peripherals p ON p.id = rel.items_id_peripheral AND p.is_deleted = 0
JOIN glpi_peripheraltypes pt ON pt.id = p.peripheraltypes_id
WHERE c.is_deleted = 0
  AND pt.name LIKE '%USB%';


-- 5. Peripheral chưa gắn vào bất kỳ tài sản nào (tồn kho)
SELECT p.id, p.name, p.serial, pt.name AS peripheral_type
FROM glpi_peripherals p
LEFT JOIN glpi_peripheraltypes pt ON pt.id = p.peripheraltypes_id
WHERE p.is_deleted = 0
  AND p.id NOT IN (
      SELECT items_id_peripheral
      FROM glpi_assets_assets_peripheralassets
      WHERE itemtype_peripheral = 'Peripheral' AND is_deleted = 0
  );


-- #####################################################################
-- B. COMPUTER + USER (NGƯỜI SỬ DỤNG / KỸ THUẬT VIÊN)
-- #####################################################################

-- 6. Danh sách Computer kèm người sử dụng (users_id) và kỹ thuật viên phụ trách
SELECT
    c.id, c.name AS computer_name,
    c.contact AS Login_User,
    u.name AS username, CONCAT(u.realname,' ',u.firstname) AS fullname,
    ut.name AS tech_username
FROM glpi_computers c
LEFT JOIN glpi_users u  ON u.id  = c.users_id
LEFT JOIN glpi_users ut ON ut.id = c.users_id_tech
WHERE c.is_deleted = 0
ORDER BY c.name;


-- 7. Computer CHƯA gán người sử dụng nào (users_id = 0)
SELECT c.id, c.name, c.serial, l.name AS location
FROM glpi_computers c
LEFT JOIN glpi_locations l ON l.id = c.locations_id
WHERE c.is_deleted = 0 AND c.users_id = 0;


-- 8. Số lượng máy đang được sử dụng bởi từng User
SELECT
    u.id AS user_id, u.name AS username,
    CONCAT(u.realname,' ',u.firstname) AS fullname,
    COUNT(c.id) AS so_may_dang_dung
FROM glpi_users u
JOIN glpi_computers c ON c.users_id = u.id AND c.is_deleted = 0
GROUP BY u.id, u.name, u.realname, u.firstname
ORDER BY so_may_dang_dung DESC;


-- #####################################################################
-- C. COMPUTER + MẠNG (IP / MAC / HOSTNAME)
-- #####################################################################

-- 9. Computer + IP + MAC (join qua NetworkPort -> NetworkName -> IPAddress)
SELECT DISTINCT
    c.id AS computer_id, c.name AS computer_name,
    np.name AS network_port, np.mac,
    nn.name AS hostname,
    ip.name AS ip_address
FROM glpi_computers c
JOIN glpi_networkports np
    ON np.itemtype = 'Computer' AND np.items_id = c.id AND np.is_deleted = 0
LEFT JOIN glpi_networknames nn
    ON nn.itemtype = 'NetworkPort' AND nn.items_id = np.id AND nn.is_deleted = 0
LEFT JOIN glpi_ipaddresses ip
    ON ip.itemtype = 'NetworkName' AND ip.items_id = nn.id AND ip.is_deleted = 0
WHERE c.is_deleted = 0
ORDER BY c.name;


-- 10. Cách nhanh hơn: lấy IP trực tiếp qua mainitemtype/mainitems_id (IP gắn thẳng vào Computer)
SELECT
    c.id, c.name AS computer_name, ip.name AS ip_address
FROM glpi_computers c
JOIN glpi_ipaddresses ip
    ON ip.mainitemtype = 'Computer' AND ip.mainitems_id = c.id AND ip.is_deleted = 0
WHERE c.is_deleted = 0;


-- 11. Tìm Computer theo địa chỉ MAC cụ thể (đổi giá trị MAC cần tìm)
SELECT c.id, c.name, np.mac
FROM glpi_networkports np
JOIN glpi_computers c ON c.id = np.items_id AND np.itemtype = 'Computer'
WHERE np.mac = 'AA:BB:CC:DD:EE:FF'   -- <-- thay MAC cần tra cứu
  AND c.is_deleted = 0;


-- 12. Danh sách Computer bị trùng địa chỉ IP (phát hiện xung đột IP)
SELECT ip.name AS ip_address, COUNT(*) AS so_lan_trung
FROM glpi_ipaddresses ip
WHERE ip.is_deleted = 0 AND ip.name <> '' AND ip.name IS NOT NULL
GROUP BY ip.name
HAVING COUNT(*) > 1;


-- #####################################################################
-- D. COMPUTER + PHẦN CỨNG (RAM / CPU / HDD-SSD)
-- #####################################################################

-- 13. Computer + CPU (tên CPU, số core, số luồng, tốc độ)
SELECT
    c.id, c.name AS computer_name,
    dp.designation AS cpu_name,
    idp.nbcores, idp.nbthreads, idp.frequency AS mhz
FROM glpi_computers c
JOIN glpi_items_deviceprocessors idp
    ON idp.itemtype = 'Computer' AND idp.items_id = c.id AND idp.is_deleted = 0
JOIN glpi_deviceprocessors dp ON dp.id = idp.deviceprocessors_id
WHERE c.is_deleted = 0
ORDER BY c.name;


-- 14. Computer + RAM (từng thanh RAM và tổng dung lượng RAM)
SELECT
    c.id, c.name AS computer_name,
    idm.size AS ram_mb_tung_thanh,
    SUM(idm.size) OVER (PARTITION BY c.id) AS tong_ram_mb
FROM glpi_computers c
JOIN glpi_items_devicememories idm
    ON idm.itemtype = 'Computer' AND idm.items_id = c.id AND idm.is_deleted = 0
WHERE c.is_deleted = 0
ORDER BY c.name;


-- 15. Tổng RAM (GB) + CPU của từng Computer, gộp trên 1 dòng
SELECT
    c.id, c.name AS computer_name,
    ROUND(COALESCE(ram.tong_ram_mb,0)/1024, 1) AS ram_gb,
    cpu.cpu_list
FROM glpi_computers c
LEFT JOIN (
    SELECT items_id, SUM(size) AS tong_ram_mb
    FROM glpi_items_devicememories
    WHERE itemtype = 'Computer' AND is_deleted = 0
    GROUP BY items_id
) ram ON ram.items_id = c.id
LEFT JOIN (
    SELECT idp.items_id, GROUP_CONCAT(dp.designation SEPARATOR ', ') AS cpu_list
    FROM glpi_items_deviceprocessors idp
    JOIN glpi_deviceprocessors dp ON dp.id = idp.deviceprocessors_id
    WHERE idp.itemtype = 'Computer' AND idp.is_deleted = 0
    GROUP BY idp.items_id
) cpu ON cpu.items_id = c.id
WHERE c.is_deleted = 0
ORDER BY c.name;


-- 16. Computer + Ổ cứng HDD/SSD (dung lượng, loại)
SELECT
    c.id, c.name AS computer_name,
    dh.designation AS o_cung,
    idh.capacity AS dung_luong_mb,
    ROUND(idh.capacity/1024, 1) AS dung_luong_gb
FROM glpi_computers c
JOIN glpi_items_deviceharddrives idh
    ON idh.itemtype = 'Computer' AND idh.items_id = c.id AND idh.is_deleted = 0
JOIN glpi_deviceharddrives dh ON dh.id = idh.deviceharddrives_id
WHERE c.is_deleted = 0
ORDER BY c.name;


-- 17. Computer có tổng dung lượng ổ cứng dưới 128GB (cảnh báo cấu hình yếu)
SELECT c.id, c.name, SUM(idh.capacity) AS tong_dung_luong_mb
FROM glpi_computers c
JOIN glpi_items_deviceharddrives idh
    ON idh.itemtype = 'Computer' AND idh.items_id = c.id AND idh.is_deleted = 0
WHERE c.is_deleted = 0
GROUP BY c.id, c.name
HAVING SUM(idh.capacity) < 128*1024;


-- #####################################################################
-- E. COMPUTER + SOFTWARE / LICENSE / ANTIVIRUS
-- #####################################################################

-- 18. Computer + toàn bộ Software đã cài
SELECT
    c.id, c.name AS computer_name,
    sw.name AS software_name, sv.name AS version, isv.date_install
FROM glpi_computers c
JOIN glpi_items_softwareversions isv
    ON isv.itemtype = 'Computer' AND isv.items_id = c.id AND isv.is_deleted = 0
JOIN glpi_softwareversions sv ON sv.id = isv.softwareversions_id
JOIN glpi_softwares sw ON sw.id = sv.softwares_id
WHERE c.is_deleted = 0
ORDER BY c.name, sw.name;


-- 19. Số lượng Software cài trên từng Computer
SELECT c.id, c.name, COUNT(*) AS so_luong_software
FROM glpi_computers c
JOIN glpi_items_softwareversions isv
    ON isv.itemtype = 'Computer' AND isv.items_id = c.id AND isv.is_deleted = 0
WHERE c.is_deleted = 0
GROUP BY c.id, c.name
ORDER BY so_luong_software DESC;


-- 20. Danh sách Computer đang cài một Software cụ thể (đổi tên phần mềm cần tra)
SELECT c.name AS computer_name, sw.name AS software_name, sv.name AS version
FROM glpi_softwares sw
JOIN glpi_softwareversions sv ON sv.softwares_id = sw.id
JOIN glpi_items_softwareversions isv ON isv.softwareversions_id = sv.id AND isv.is_deleted = 0
JOIN glpi_computers c ON c.id = isv.items_id AND isv.itemtype = 'Computer' AND c.is_deleted = 0
WHERE sw.name LIKE '%Microsoft Office%';   -- <-- đổi tên software cần tìm


-- 21. Top 15 Software được cài nhiều máy nhất
SELECT sw.name AS software_name, COUNT(DISTINCT isv.items_id) AS so_may_cai
FROM glpi_softwares sw
JOIN glpi_softwareversions sv ON sv.softwares_id = sw.id
JOIN glpi_items_softwareversions isv
    ON isv.softwareversions_id = sv.id
   AND isv.itemtype = 'Computer' AND isv.is_deleted = 0
GROUP BY sw.id, sw.name
ORDER BY so_may_cai DESC
LIMIT 15;


-- 22. Computer + Antivirus (trạng thái active, cập nhật, ngày hết hạn)
SELECT
    c.id, c.name AS computer_name,
    av.name AS antivirus_name, av.antivirus_version,
    av.is_active, av.is_uptodate, av.date_expiration
FROM glpi_computers c
JOIN glpi_itemantiviruses av
    ON av.itemtype = 'Computer' AND av.items_id = c.id AND av.is_deleted = 0
WHERE c.is_deleted = 0
ORDER BY c.name;


-- 23. Computer CHƯA cài Antivirus (rủi ro an ninh)
SELECT c.id, c.name, c.serial, l.name AS location
FROM glpi_computers c
LEFT JOIN glpi_locations l ON l.id = c.locations_id
WHERE c.is_deleted = 0
  AND c.id NOT IN (
      SELECT items_id FROM glpi_itemantiviruses
      WHERE itemtype = 'Computer' AND is_deleted = 0
  );


-- 24. Computer có Antivirus nhưng KHÔNG active hoặc KHÔNG cập nhật virus mới nhất
SELECT c.name AS computer_name, av.name AS antivirus_name,
       av.is_active, av.is_uptodate, av.signature_version
FROM glpi_computers c
JOIN glpi_itemantiviruses av
    ON av.itemtype = 'Computer' AND av.items_id = c.id AND av.is_deleted = 0
WHERE c.is_deleted = 0
  AND (av.is_active = 0 OR av.is_uptodate = 0);


-- 25. Antivirus sắp hết hạn trong 30 ngày tới
SELECT c.name AS computer_name, av.name, av.date_expiration
FROM glpi_itemantiviruses av
JOIN glpi_computers c ON c.id = av.items_id AND av.itemtype = 'Computer' AND c.is_deleted = 0
WHERE av.date_expiration BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY)
ORDER BY av.date_expiration;


-- 26. License phần mềm sắp hết hạn trong 30 ngày tới
SELECT
    sl.id, sw.name AS software_name, sl.name AS license_name,
    sl.number AS so_luong_license, sl.expire AS ngay_het_han
FROM glpi_softwarelicenses sl
LEFT JOIN glpi_softwares sw ON sw.id = sl.softwares_id
WHERE sl.is_deleted = 0
  AND sl.expire IS NOT NULL
  AND sl.expire BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY)
ORDER BY sl.expire;


-- 27. License phần mềm ĐÃ hết hạn (cần gia hạn/mua mới)
SELECT sw.name AS software_name, sl.name AS license_name, sl.expire
FROM glpi_softwarelicenses sl
LEFT JOIN glpi_softwares sw ON sw.id = sl.softwares_id
WHERE sl.is_deleted = 0
  AND sl.expire IS NOT NULL
  AND sl.expire < CURDATE();


-- 28. So sánh số license đã mua vs số máy đang cài (kiểm tra vượt quota)
SELECT
    sw.name AS software_name,
    sl.number AS so_license_mua,
    COUNT(DISTINCT isv.items_id) AS so_may_dang_cai,
    (COUNT(DISTINCT isv.items_id) - sl.number) AS chenh_lech
FROM glpi_softwarelicenses sl
JOIN glpi_softwares sw ON sw.id = sl.softwares_id
LEFT JOIN glpi_softwareversions sv ON sv.softwares_id = sw.id
LEFT JOIN glpi_items_softwareversions isv
    ON isv.softwareversions_id = sv.id
   AND isv.itemtype = 'Computer' AND isv.is_deleted = 0
WHERE sl.is_deleted = 0
GROUP BY sl.id, sw.name, sl.number
HAVING chenh_lech > 0;   -- chỉ hiện các license bị vượt số lượng cho phép


-- #####################################################################
-- F. THIẾT BỊ KHÔNG HOẠT ĐỘNG / GIÁM SÁT AGENT
-- #####################################################################

-- 29. Computer không được kiểm kê (inventory) quá 30 ngày
SELECT c.id, c.name, c.last_inventory_update, l.name AS location
FROM glpi_computers c
LEFT JOIN glpi_locations l ON l.id = c.locations_id
WHERE c.is_deleted = 0
  AND (c.last_inventory_update IS NULL
       OR c.last_inventory_update < DATE_SUB(NOW(), INTERVAL 30 DAY))
ORDER BY c.last_inventory_update;


-- 30. Computer chưa từng được kiểm kê tự động (không có agent / chưa quét)
SELECT c.id, c.name, c.date_creation
FROM glpi_computers c
WHERE c.is_deleted = 0 AND c.last_inventory_update IS NULL;


-- 31. Máy không "gọi về" (agent last_contact) quá 30 ngày -> nghi ngờ tắt máy/offline
SELECT
    c.id, c.name AS computer_name, a.last_contact, a.version AS agent_version
FROM glpi_agents a
JOIN glpi_computers c ON c.id = a.items_id AND a.itemtype = 'Computer' AND c.is_deleted = 0
WHERE a.last_contact IS NULL
   OR a.last_contact < DATE_SUB(NOW(), INTERVAL 30 DAY)
ORDER BY a.last_contact;


-- 32. Máy có last_boot (lần khởi động cuối) quá 15 ngày -> nhắc user restart/update
SELECT c.id, c.name, c.last_boot
FROM glpi_computers c
WHERE c.is_deleted = 0
  AND c.last_boot IS NOT NULL
  AND c.last_boot < DATE_SUB(NOW(), INTERVAL 15 DAY);


-- #####################################################################
-- G. TICKET (HELPDESK)
-- #####################################################################

-- 33. Danh sách Ticket theo User (người yêu cầu - requester, type=1)
SELECT
    t.id AS ticket_id, t.name AS ticket_title, t.status, t.date, t.priority,
    u.name AS requester_username
FROM glpi_tickets t
JOIN glpi_tickets_users tu ON tu.tickets_id = t.id AND tu.type = 1   -- 1 = Requester
JOIN glpi_users u ON u.id = tu.users_id
WHERE t.is_deleted = 0
ORDER BY t.date DESC;


-- 34. Danh sách Ticket theo Kỹ thuật viên xử lý (assigned, type=2)
SELECT
    t.id AS ticket_id, t.name AS ticket_title, t.status,
    u.name AS technician_username
FROM glpi_tickets t
JOIN glpi_tickets_users tu ON tu.tickets_id = t.id AND tu.type = 2   -- 2 = Assigned to
JOIN glpi_users u ON u.id = tu.users_id
WHERE t.is_deleted = 0
ORDER BY u.name, t.date DESC;


-- 35. Số lượng Ticket theo từng User yêu cầu
SELECT u.name AS username, COUNT(*) AS so_ticket
FROM glpi_tickets t
JOIN glpi_tickets_users tu ON tu.tickets_id = t.id AND tu.type = 1
JOIN glpi_users u ON u.id = tu.users_id
WHERE t.is_deleted = 0
GROUP BY u.id, u.name
ORDER BY so_ticket DESC;


-- 36. Ticket theo Entity/"Department" (dùng Entity làm đơn vị/phòng ban)
SELECT
    e.name AS department_entity, t.id AS ticket_id, t.name AS ticket_title, t.status, t.date
FROM glpi_tickets t
JOIN glpi_entities e ON e.id = t.entities_id
WHERE t.is_deleted = 0
ORDER BY e.name, t.date DESC;


-- 37. Tổng số Ticket theo Entity/phòng ban
SELECT e.name AS department_entity, COUNT(*) AS so_ticket
FROM glpi_tickets t
JOIN glpi_entities e ON e.id = t.entities_id
WHERE t.is_deleted = 0
GROUP BY e.id, e.name
ORDER BY so_ticket DESC;


-- 38. Ticket theo Group (nhóm hỗ trợ được assign xử lý)
SELECT g.name AS group_name, t.id AS ticket_id, t.name AS ticket_title, t.status
FROM glpi_tickets t
JOIN glpi_groups_tickets gt ON gt.tickets_id = t.id AND gt.type = 2   -- 2 = Assigned group
JOIN glpi_groups g ON g.id = gt.groups_id
WHERE t.is_deleted = 0
ORDER BY g.name;


-- 39. Thống kê Ticket theo trạng thái (status: 1-New,2-Processing(assigned),
--     3-Processing(planned),4-Pending,5-Solved,6-Closed)
SELECT
    status,
    CASE status
        WHEN 1 THEN 'Mới'
        WHEN 2 THEN 'Đang xử lý (đã giao)'
        WHEN 3 THEN 'Đang xử lý (đã lên KH)'
        WHEN 4 THEN 'Tạm dừng'
        WHEN 5 THEN 'Đã xử lý xong'
        WHEN 6 THEN 'Đã đóng'
        ELSE 'Khác'
    END AS trang_thai,
    COUNT(*) AS so_luong
FROM glpi_tickets
WHERE is_deleted = 0
GROUP BY status
ORDER BY status;


-- 40. Ticket đang mở nhưng đã quá hạn SLA xử lý (time_to_resolve đã qua nhưng chưa đóng)
SELECT
    t.id, t.name, t.date, t.time_to_resolve, t.status
FROM glpi_tickets t
WHERE t.is_deleted = 0
  AND t.status NOT IN (5,6)                 -- chưa Solved/Closed
  AND t.time_to_resolve IS NOT NULL
  AND t.time_to_resolve < NOW();


-- 41. Ticket mở theo tháng (xu hướng số lượng ticket 12 tháng gần nhất)
SELECT
    DATE_FORMAT(t.date, '%Y-%m') AS thang,
    COUNT(*) AS so_ticket
FROM glpi_tickets t
WHERE t.is_deleted = 0
  AND t.date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY thang
ORDER BY thang;


-- 42. Thời gian xử lý trung bình (giờ) của Ticket đã đóng, theo Entity
SELECT
    e.name AS department_entity,
    ROUND(AVG(TIMESTAMPDIFF(HOUR, t.date, t.closedate)), 1) AS tb_gio_xu_ly
FROM glpi_tickets t
JOIN glpi_entities e ON e.id = t.entities_id
WHERE t.is_deleted = 0 AND t.closedate IS NOT NULL
GROUP BY e.id, e.name;


-- #####################################################################
-- H. TÀI SẢN THEO LOCATION / STATE / ENTITY (TỔNG HỢP)
-- #####################################################################

-- 43. Toàn bộ tài sản (Computer + Monitor + Peripheral + NetworkEquipment) theo Location
SELECT l.name AS location, 'Computer' AS loai, COUNT(*) AS so_luong
FROM glpi_computers c JOIN glpi_locations l ON l.id = c.locations_id
WHERE c.is_deleted = 0 GROUP BY l.name
UNION ALL
SELECT l.name, 'Monitor', COUNT(*)
FROM glpi_monitors m JOIN glpi_locations l ON l.id = m.locations_id
WHERE m.is_deleted = 0 GROUP BY l.name
UNION ALL
SELECT l.name, 'Peripheral', COUNT(*)
FROM glpi_peripherals p JOIN glpi_locations l ON l.id = p.locations_id
WHERE p.is_deleted = 0 GROUP BY l.name
UNION ALL
SELECT l.name, 'NetworkEquipment', COUNT(*)
FROM glpi_networkequipments n JOIN glpi_locations l ON l.id = n.locations_id
WHERE n.is_deleted = 0 GROUP BY l.name
ORDER BY location, loai;


-- 44. Computer theo Location (chi tiết)
SELECT l.name AS location, c.id, c.name AS computer_name
FROM glpi_computers c
JOIN glpi_locations l ON l.id = c.locations_id
WHERE c.is_deleted = 0
ORDER BY l.name, c.name;


-- 45. Số lượng Computer theo State (tình trạng: đang dùng/lưu kho/hỏng...)
SELECT s.name AS state_name, COUNT(*) AS so_luong
FROM glpi_computers c
LEFT JOIN glpi_states s ON s.id = c.states_id
WHERE c.is_deleted = 0
GROUP BY s.name
ORDER BY so_luong DESC;


-- 46. Số lượng Computer theo Model + Type
SELECT
    cty.name AS computer_type, cm.name AS computer_model, COUNT(*) AS so_luong
FROM glpi_computers c
LEFT JOIN glpi_computertypes cty ON cty.id = c.computertypes_id
LEFT JOIN glpi_computermodels cm  ON cm.id  = c.computermodels_id
WHERE c.is_deleted = 0
GROUP BY cty.name, cm.name
ORDER BY so_luong DESC;


-- 47. Số lượng tài sản (Computer) theo Entity (đơn vị quản lý)
SELECT e.name AS entity_name, COUNT(*) AS so_luong_computer
FROM glpi_computers c
JOIN glpi_entities e ON e.id = c.entities_id
WHERE c.is_deleted = 0
GROUP BY e.name
ORDER BY so_luong_computer DESC;


-- #####################################################################
-- I. DASHBOARD QUẢN TRỊ (TỔNG HỢP NHANH)
-- #####################################################################

-- 48. Dashboard tổng quan số lượng tài sản theo từng loại
SELECT 'Computer' AS loai_tai_san, COUNT(*) AS so_luong FROM glpi_computers WHERE is_deleted = 0
UNION ALL
SELECT 'Monitor', COUNT(*) FROM glpi_monitors WHERE is_deleted = 0
UNION ALL
SELECT 'Peripheral', COUNT(*) FROM glpi_peripherals WHERE is_deleted = 0
UNION ALL
SELECT 'NetworkEquipment', COUNT(*) FROM glpi_networkequipments WHERE is_deleted = 0
UNION ALL
SELECT 'Software', COUNT(*) FROM glpi_softwares WHERE is_deleted = 0
UNION ALL
SELECT 'User (active)', COUNT(*) FROM glpi_users WHERE is_deleted = 0 AND is_active = 1;


-- 49. Dashboard: tỷ lệ máy có/không có Antivirus (%)
SELECT
    (SELECT COUNT(*) FROM glpi_computers WHERE is_deleted = 0) AS tong_so_may,
    (SELECT COUNT(DISTINCT items_id) FROM glpi_itemantiviruses
        WHERE itemtype = 'Computer' AND is_deleted = 0)        AS so_may_co_av,
    ROUND(
      (SELECT COUNT(DISTINCT items_id) FROM glpi_itemantiviruses
          WHERE itemtype = 'Computer' AND is_deleted = 0)
      / (SELECT COUNT(*) FROM glpi_computers WHERE is_deleted = 0) * 100
    , 1) AS ty_le_phan_tram_co_av;


-- 50. Dashboard: Ticket mở trong tháng hiện tại theo trạng thái + top 5 KTV xử lý nhiều nhất
SELECT
    CASE status
        WHEN 1 THEN 'Mới' WHEN 2 THEN 'Đang xử lý' WHEN 3 THEN 'Đang xử lý (KH)'
        WHEN 4 THEN 'Tạm dừng' WHEN 5 THEN 'Đã xử lý' WHEN 6 THEN 'Đã đóng'
        ELSE 'Khác' END AS trang_thai,
    COUNT(*) AS so_luong
FROM glpi_tickets
WHERE is_deleted = 0
  AND DATE_FORMAT(date, '%Y-%m') = DATE_FORMAT(CURDATE(), '%Y-%m')
GROUP BY status;

SELECT u.name AS ky_thuat_vien, COUNT(*) AS so_ticket_xu_ly
FROM glpi_tickets t
JOIN glpi_tickets_users tu ON tu.tickets_id = t.id AND tu.type = 2
JOIN glpi_users u ON u.id = tu.users_id
WHERE t.is_deleted = 0
GROUP BY u.name
ORDER BY so_ticket_xu_ly DESC
LIMIT 5;