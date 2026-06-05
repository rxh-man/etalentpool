
CREATE TABLE public.transformation_plan (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  category text NOT NULL,
  phase text NOT NULL,
  action text NOT NULL,
  owner text,
  project text,
  suggested_solution text,
  created_at timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.transformation_plan TO anon, authenticated;
GRANT ALL ON public.transformation_plan TO service_role;
ALTER TABLE public.transformation_plan ENABLE ROW LEVEL SECURITY;
CREATE POLICY "tp_all_read" ON public.transformation_plan FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "tp_all_insert" ON public.transformation_plan FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "tp_all_update" ON public.transformation_plan FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);
CREATE POLICY "tp_all_delete" ON public.transformation_plan FOR DELETE TO anon, authenticated USING (true);
ALTER PUBLICATION supabase_realtime ADD TABLE public.transformation_plan;
