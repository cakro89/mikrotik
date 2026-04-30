# ✅ SCRIPT ISOLIR AUTO BERDASARKAN COMEN USER 

## COMENT USER PPP 2026-04-22 
## KALAU TGL COCOK ATAUBERLALU DIA AUTO JLAN
## SCRIPT SYSTEM/SCRIPT
```bash

:local profileIsolir "ISOLIR"

:local date [/system clock get date]





:local y [:pick $date 0 4]

:local m [:pick $date 5 7]

:local d [:pick $date 8 10]

:local today ($y . $m . $d)



:log info "--- Memulai Cek Isolir ($date) ---"



/ppp secret {

    :foreach i in=[find where profile!=$profileIsolir] do={

        :local user [get $i name]

        :local comm [get $i comment]

        

    

        :if ([:len $comm] = 10) do={

            # Ambil angka saja dari comment (hilangkan strip)

            :local cy [:pick $comm 0 4]

            :local cm [:pick $comm 5 7]

            :local cd [:pick $comm 8 10]

            :local expired ($cy . $cm . $cd)

            

          

            :if ($expired < $today) do={

                :log warning "USER EXPIRED: $user dipindah ke ISOLIR (Jatuh tempo: $comm)"

                set $i profile=$profileIsolir

                

               

                /ppp active remove [find where name=$user]

            }

        }

    }

}

```
## SCRITP DISABLE USER PPP DENGAN COMEN 
```bash

:local date [/system clock get date]

# Ambil tanggal hari ini (Format yyyy-mm-dd)
:local y [:pick $date 0 4]
:local m [:pick $date 5 7]
:local d [:pick $date 8 10]
:local today ($y . $m . $d)

:log info "--- Memulai Cek Jatuh Tempo (Mode: Disable) ---"

/ppp secret {
    # Cari user yang statusnya masih enabled
    :foreach i in=[find where disabled=no] do={
        :local user [get $i name]
        :local comm [get $i comment]
        
        # Cek format comment 10 digit (YYYY-MM-DD)
        :if ([:len $comm] = 10) do={
            :local cy [:pick $comm 0 4]
            :local cm [:pick $comm 5 7]
            :local cd [:pick $comm 8 10]
            :local expired ($cy . $cm . $cd)
            
            # Jika tanggal expired lebih kecil dari hari ini
            :if ($expired < $today) do={
                :log warning "USER EXPIRED: $user dinonaktifkan (Jatuh tempo: $comm)"
                
                # Disable user di PPP Secret
                disable $i
                
                # Hapus user dari PPP Active agar koneksi terputus saat itu juga
                /ppp active remove [find where name=$user]
            }
        }
    }
}
```


