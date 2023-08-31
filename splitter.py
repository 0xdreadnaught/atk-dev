def split_file(file_path, lines_per_file):
    with open(file_path, 'r') as f:
        lines = f.readlines()
    
    total_lines = len(lines)
    num_files = (total_lines // lines_per_file) + (1 if total_lines % lines_per_file > 0 else 0)
    
    for i in range(num_files):
        start_index = i * lines_per_file
        end_index = min((i + 1) * lines_per_file, total_lines)
        
        new_file_name = f"{file_path.split('.')[0]}_part{i+1}.yml"
        
        with open(new_file_name, 'w') as new_f:
            new_f.writelines(lines[start_index:end_index])

if __name__ == "__main__":
    file_path = "./config.template.yml"
    lines_per_file = 100
    split_file(file_path, lines_per_file)
