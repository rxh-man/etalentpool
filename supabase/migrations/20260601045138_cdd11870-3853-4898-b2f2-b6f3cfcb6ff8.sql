CREATE TABLE public.candidates (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  sn text,
  emp_id text,
  candidate_name text,
  company text,
  interview_date text,
  attendance text,
  technical_knowledge text,
  communication_skill text,
  driving_licence text,
  designation text,
  recommended_for text,
  remarks text,
  created_at timestamptz NOT NULL DEFAULT now()
);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.candidates TO anon;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.candidates TO authenticated;
GRANT ALL ON public.candidates TO service_role;

ALTER TABLE public.candidates ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public read candidates" ON public.candidates FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "public insert candidates" ON public.candidates FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "public update candidates" ON public.candidates FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);
CREATE POLICY "public delete candidates" ON public.candidates FOR DELETE TO anon, authenticated USING (true);