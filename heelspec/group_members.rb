module Heelspec
  class GroupMembers < Heel::Bot

    attr_reader :groups

    def initialize
      @bot_name = "Mail Group Manager"
      @bot_version = "1.0.0"

      @groups = {
        "dev" => {
          :description => "Development Integration Group",
          :members => ["zhangwanlong", "cuishichao", "yunting", "miaodongdong", "dengxi", "hanpeng03", "hezhipeng"],
          :managers => ["luhua01", "hejian01"]
        },
        "bravo" => {
          :description => "Bravo Team",
          :members => ["zhangwanlong", "cuishichao", "yunting", "miaodongdong", "dengxi"],
          :managers => ["luhua01"]
        },
        "tech_core" => {
          :description => "MSBU Tech Core",
          :members => ["zhangwanlong", "dengxi", "hanpeng03", "wanghuaiqing"],
          :managers => ["luhua01", "hejian01"]
        },
        "tech" => {
          :description => "MSBU Tech",
          :members => ["zhangwanlong", "dengxi", "hanpeng03", "wanghuaiqing", "liurenfei", "wuyan08", "hezhipeng", "hejie03", "yanglong01"],
          :managers => ["luhua01", "hejian01"]
        }
      }
    end

    def run(cmd)
      if cmd.length == 0
        puts "Error: Nil group name"
        return
      end

      if cmd[0] == "all"
        print_all_groups
        puts ""
        return
      elsif cmd[0] == "list"
        list_group
        return
      end

      group_info = get_group cmd[0]
      if group_info != false
        print_group_info group_info
      else
        puts "Error: No such group #{cmd}"
      end
    end

    def list_group
      @groups.keys.each do |name|
        puts name
      end
    end

    def print_all_groups
      @groups.each do |_name, info|
        print_group_info info
        puts ""
      end
    end

    def print_group_info(info)
      puts info[:description]
      puts info[:members].join ","
      puts info[:managers].join ","
    end

    def get_group(group_name)
      if @groups.has_key? group_name
        @groups[group_name]
      else
        false
      end
    end
  end
end
