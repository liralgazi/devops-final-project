{{- define "my-app.name" -}}
my-app
{{- end }}

{{- define "my-app.fullname" -}}
{{ .Release.Name }}-my-app
{{- end }}

{{- define "my-app.labels" -}}
app.kubernetes.io/name: {{ include "my-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "my-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "my-app.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- .Values.serviceAccount.name }}
{{- end }}
{{- end }}

