<?php

namespace App\Http\Requests\Dashboard\Admin\Project;

use Illuminate\Foundation\Http\FormRequest;

class StoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'project_title' => ['required'],
            'description' => ['required'],
            'status' => ['required'],
            'company_id' => ['required'],
        ];
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'project_title.required' => __('The :attribute field is required', ['attribute' => __('project title')]),
            'description.required' => __('The :attribute field is required', ['attribute' => __('description')]),
            'status.required' => __('The :attribute field is required', ['attribute' => __('status')]),
            'company_id.required' => __('The :attribute field is required', ['attribute' => __('company')]),
        ];
    }
}
