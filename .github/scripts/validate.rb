# Validates every _data/implementations/*.yml entry. Stdlib only.
require "yaml"
require "date"
ROLES = %w[host client relay sdk]
CONN = %w[relay lan]
errors = []
Dir["_data/implementations/*.yml"].sort.each do |f|
  slug = File.basename(f, ".yml")
  e = YAML.safe_load(File.read(f), permitted_classes: [Date]) rescue (errors << "#{f}: not valid YAML"; next)
  err = ->(m) { errors << "#{f}: #{m}" }
  err.("file name must be lowercase letters, digits and dashes") unless slug.match?(/\A[a-z0-9][a-z0-9-]*\z/)
  next err.("must be a mapping") unless e.is_a?(Hash)
  %w[name url maintainer license role use_case connection e2e multi_device conformance].each { |k| err.("missing #{k}") unless e.key?(k) }
  %w[url repo].each { |k| err.("#{k} must start with https://") if e[k] && !e[k].to_s.start_with?("https://") }
  err.("role must be one of #{ROLES.join(', ')}") unless ROLES.include?(e["role"])
  err.("use_case must be one line under 120 characters") if e["use_case"].to_s.empty? || e["use_case"].to_s.length > 120 || e["use_case"].to_s.include?("\n")
  c = e["connection"]
  err.("connection must be a non-empty list of #{CONN.join(', ')}") unless c.is_a?(Array) && !c.empty? && (c - CONN).empty?
  %w[e2e multi_device].each { |k| err.("#{k} must be true or false") unless [true, false].include?(e[k]) }
  cf = e["conformance"]
  if cf.is_a?(Hash)
    err.("conformance.suite must be a version like \"0.1\"") unless cf["suite"].to_s.match?(/\A\d+\.\d+\z/)
    err.("conformance.passed must be a date (YYYY-MM-DD)") unless cf["passed"].is_a?(Date)
    err.("conformance.report must be an https link to the full suite output") unless cf["report"].to_s.start_with?("https://")
  else
    err.("conformance must include suite, passed and report")
  end
end
puts errors.empty? ? "All entries valid." : errors
exit(errors.empty? ? 0 : 1)
