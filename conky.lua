-- Simple helper to get the string of a command
function command_string(command)
	fp = io.popen(command)
	result = fp:read("*a")
	fp:close()

	return result
end

-- The pretified version of the OS name to print out
--
system_pretty_name = command_string("cat /etc/os-release | grep PRETTY_NAME | sed -e 's/^PRETTY_NAME=\"//' -e 's/\"$//'")

function conky_system_pretty_name()
	return system_pretty_name
end

-- Name of the CPU being used
--
fp = io.popen("cat /proc/cpuinfo | grep 'model name' | sort -u | sed -e 's/model name\t: //' -e 's/ with .*$//'")
cpu_name = fp:read("*a")
fp:close()

function conky_cpu_name()
	return cpu_name
end

-- Max safe temperature of the CPU
--
fp = io.popen("sensors k10temp-pci-00c3 -j | jq '.\"k10temp-pci-00c3\".Tdie.temp1_max' | sed -e 's/\\..*$//'")
cpu_temp_max = tonumber(fp:read("*a"))
fp:close()

-- Max safe temperature of NVMe storage
--
fp = io.popen("sensors nvme-pci-0100 -j | jq '.\"nvme-pci-0100\".Composite.temp1_max'")
nvme_temp_max = tonumber(fp:read("*a"))
fp:close()

function conky_cpu_temp_current()
	fp = io.popen("sensors -u k10temp-pci-00c3 -j | jq '.\"k10temp-pci-00c3\".Tdie.temp1_input'")
	cpu_temp_current = tonumber(fp:read("*a"))
	fp:close()

	return math.ceil(cpu_temp_current)
end

-- Calculate percent of max the CPU is
function conky_cpu_temp_percent()
	return math.ceil((conky_cpu_temp_current() / cpu_temp_max) * 100)
end

-- Calculate percent of max NVMe storage temp is
function nvme_temp_percent()
	fp = io.popen("sensors nvme-pci-0100 -j | jq '.\"nvme-pci-0100\".Composite.temp1_input'")
	temp_nvme_current = tonumber(fp:read("*a"))
	fp:close()

	return math.ceil((temp_nvme_current / temp_nvme_max) * 100)
end

