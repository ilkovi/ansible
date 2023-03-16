
sar -r | grep -v Average | tail -n 1 |\
awk '
{
            date = $1
            kbmemfree = $3
            kbmemused = $4
            kbbuffers = $6
            kbcached = $7

        total_mem_kb = kbmemfree + kbmemused
        kbused_minus_bufcache = kbmemused + kbbuffers - kbcached

        one_persent_is = total_mem_kb/100
        Memory_usage_persentage = kbused_minus_bufcache/one_persent_is

        #printf("%s %s %s %d%s\n", "Date", date, "Memory Usage without cached :" , Memory_usage_persentage, "%")
        print ('Date', date, "Memory Usage without cached :" , Memory_usage_persentage, "%") >> "/root/Mem_Usage_without_cache.log";
        printf("%d\n",Memory_usage_persentage)

}'